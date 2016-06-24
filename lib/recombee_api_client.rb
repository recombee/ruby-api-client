require 'recombee_api_client/version'
require 'securerandom'
require 'digest/hmac'
require 'httparty'
require 'json'
require 'open-uri'
require 'net/https'
require 'timeout'

require 'recombee_api_client/errors'
Gem.find_files('recombee_api_client/api/*.rb').each { |path| require path }

module RecombeeApiClient
  class RecombeeClient
    include HTTParty

    def initialize(account, token, options = {})
      @account = account
      @token = token
      options[:base_uri] = ENV['API_URI'] if ENV.key? 'API_URI'
      options[:base_uri] ||= 'https://rapi.recombee.com'
      @base_uri = options[:base_uri]
    end

    def send(request)
      @request = request
      uri = request.path
      uri.slice! ('/{databaseId}/')
      uri = URI.escape uri
      timeout = request.timeout / 1000
      # puts uri
      begin
        case request.method
        when :put
          hmac_put(uri, timeout)
        when :get
          hmac_get(uri, timeout)
        when :post
          hmac_post(uri, timeout, request.body_parameters.to_json)
        when :delete
          hmac_delete(uri, timeout)
        end
      rescue Timeout::Error
        fail ApiTimeout.new(@request)
      end
    end

    private

    def hmac_put(uri, timeout, options = {})
      r = self.class.put(sign_url(uri), query: options, timeout: timeout)
      check_errors r
      r.body
    end

    def hmac_get(uri, timeout, options = {})
      r = self.class.get(sign_url(uri), query: options, timeout: timeout)
      check_errors r
      JSON.parse(r.body)
    end

    def hmac_post(uri, timeout, options = {})
      url = sign_url(uri)
      # pass arguments in body
      r = self.class.post(url, body: options,
                        headers: { 'Content-Type' => 'application/json' },
                        timeout: timeout)
      check_errors r
      begin
        return JSON.parse(r.body)
      rescue JSON::ParserError
        return r.body
      end
    end

    def hmac_delete(uri, timeout, options = {})
      r = self.class.delete(sign_url(uri), query: options, timeout: timeout)
      check_errors r
      r.body
    end

    def check_errors(response)
      status_code = response.code
      return if status_code == 200 || status_code == 201
      fail ResponseError.new(@request, status_code, response.body)
    end

    # Sign request with HMAC, request URI must be exacly the same
    # We have 30s to complete request with this token
    def sign_url(req)
      uri = "/#{@account}/#{req}"
      time = hmac_time(uri)
      sign = hmac_sign(uri, time)
      @base_uri + uri + time + "&hmac_sign=#{sign}"
    end

    def hmac_time(uri)
      res = (uri.include? '?') ? '&' : '?'
      res << "hmac_timestamp=#{Time.now.utc.to_i}"
    end

    def hmac_sign(uri, time)
      url = uri + time
      Digest::HMAC.hexdigest(url, @token, Digest::SHA1)
    end
  end
end

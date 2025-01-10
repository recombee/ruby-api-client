require 'recombee_api_client/version'
require 'securerandom'
require 'openssl'
require 'httparty'
require 'json'
require 'open-uri'
require 'net/https'
require 'timeout'
require 'cgi'

require 'recombee_api_client/errors'
Gem.find_files('recombee_api_client/api/*.rb').each { |path| require path }

module RecombeeApiClient
  ##
  # Client for sending requests to Recombee recommender system
  class RecombeeClient
    include HTTParty

    BATCH_MAX_SIZE = 10000
    USER_AGENT = {'User-Agent' => 'recombee-ruby-api-client/5.0.0'}

    ##
    #   - +account+ -> Name of your account at Recombee
    #   - +token+ -> Secret token obtained from Recombee for signing requests
    def initialize(account, token, options = {})
      @account = account
      @token = token
      @protocol = options[:protocol] || 'https'
      @base_uri = get_base_uri(options)
    end

    ##
    #   - +request+ -> ApiRequest to be sent to Recombee recommender
    def send(request)

      return send_multipart_batch(request) if request.kind_of? Batch and request.requests.size > BATCH_MAX_SIZE

      timeout = request.timeout / 1000
      uri = process_request_uri(request)
      uri = sign_url(uri)
      protocol = request.ensure_https ? 'https' : @protocol.to_s
      uri = protocol + '://' + @base_uri + uri
      # puts uri
      begin
        case request.method
        when :put
          put(request, uri, timeout)
        when :get
          get(request, uri, timeout)
        when :post
          post(request, uri, timeout)
        when :delete
          delete(request, uri, timeout)
        end
      rescue Timeout::Error
        fail ApiTimeout.new(request)
      end
    end

    private

    def get_regional_base_uri(region)
      uri = {
            'ap-se' => 'rapi-ap-se.recombee.com',
            'ca-east' => 'rapi-ca-east.recombee.com',
            'eu-west' => 'rapi-eu-west.recombee.com',
            'us-west' => 'rapi-us-west.recombee.com'
          }[region.to_s.gsub('_', '-').downcase]
      raise ArgumentError.new("Region \"#{region}\" is unknown. You may need to update the version of the SDK.") if uri == nil
      uri
    end

    def get_base_uri(options)
      base_uri = ENV['RAPI_URI']
      base_uri ||= options[:base_uri]

      if options.key? :region
        raise ArgumentError.new(':base_uri and :region cannot be specified at the same time') if base_uri
        base_uri = get_regional_base_uri(options[:region])
      end
      base_uri||= 'rapi.recombee.com'
      base_uri
    end

    def put(request, uri, timeout)
      response = self.class.put(uri, body: request.body_parameters.to_json, 
                                headers: { 'Content-Type' => 'application/json' }.merge(USER_AGENT),
                                timeout: timeout)
      check_errors(response, request)
      response.body
    end

    def get(request, uri, timeout)
      response = self.class.get(uri, timeout: timeout, headers: USER_AGENT)
      check_errors(response, request)
      JSON.parse(response.body)
    end

    def post(request, uri, timeout)
      response = self.class.post(uri, body: request.body_parameters.to_json, 
                                 headers: { 'Content-Type' => 'application/json' }.merge(USER_AGENT),
                                 timeout: timeout)
      check_errors(response, request)
      begin
        return JSON.parse(response.body)
      rescue JSON::ParserError
        return response.body
      end
    end

    def delete(request, uri, timeout)
      response = self.class.delete(uri, body: request.body_parameters.to_json,
                                   headers: { 'Content-Type' => 'application/json' }.merge(USER_AGENT),
                                   timeout: timeout)
      check_errors(response, request)
      begin
        return JSON.parse(response.body)
      rescue JSON::ParserError
        return response.body
      end
    end

    def check_errors(response, request)
      status_code = response.code
      return if status_code == 200 || status_code == 201
      fail ResponseError.new(request, status_code, response.body)
    end

    def send_multipart_batch(request)
      requests_parts = request.requests.each_slice(BATCH_MAX_SIZE)
      responses = requests_parts.map {|rqs| Batch.new(rqs)}.map{|batch| send(batch)}
      responses.inject([]){|result,resp| result + resp}
    end

    def process_request_uri(request)
      uri = request.path
      uri.slice! ('/{databaseId}/')
      uri += query_parameters_to_url(request)
      uri
    end

    def query_parameters_to_url(req)
      ps = ''
      req.query_parameters.each do |name, val|
        ps += (ps.include? '?') ? '&' : '?'
        ps += "#{name}=#{format_query_parameter_value(val)}"
      end
      ps
    end

    def format_query_parameter_value(value)
      return CGI::escape("#{value}") unless value.kind_of?(Array)
      value.map{|v| CGI::escape("#{v}")}.join(',')
    end

    # Sign request with HMAC, request URI must be exacly the same
    # We have 30s to complete request with this token
    def sign_url(req_part)
      uri = "/#{@account}/#{req_part}"
      time = hmac_time(uri)
      sign = hmac_sign(uri, time)
      res = uri + time + "&hmac_sign=#{sign}"
      res
    end

    def hmac_time(uri)
      res = (uri.include? '?') ? '&' : '?'
      res << "hmac_timestamp=#{Time.now.utc.to_i}"
    end

    def hmac_sign(uri, time)
      url = uri + time
      digest = OpenSSL::Digest.new('sha1')
      OpenSSL::HMAC.hexdigest(digest, @token, url)
    end
  end
end

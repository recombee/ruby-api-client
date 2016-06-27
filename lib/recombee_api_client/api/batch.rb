require 'json'
require 'cgi'
require_relative 'request'

module RecombeeApiClient
  ##
  # Batch processing allows you to submit arbitrary sequence of requests
  #
  class Batch < ApiRequest
    attr_reader :requests
    attr_accessor :timeout
    attr_accessor :ensure_https
    ##
    # * *Required arguments*
    #   - +requests+ -> Array of API requests.
    #
    def initialize(requests)
      @requests = requests
      @body_parameters = requests_to_batch_hash
      @timeout = requests.map{|r| r.timeout}.reduce(:+)
      @ensure_https = true
    end

    # HTTP method
    def method
      :post
    end

    # Values of body parameters as a Hash
    attr_reader :body_parameters

    # Get values of parameters in form a Hash.
    # name of parameter => value of the parameter
    def params_hash
    end

    # Relative path to the endpoint
    def path
      p = '/{databaseId}/batch/'
      p
    end

    private

    def requests_to_batch_hash
      reqs = []
      @requests.each { |r| reqs.push(request_to_batch_hash r) }
      {'requests' => reqs}
    end

    def request_to_batch_hash(req)
      path = req.basic_path
      path.slice! ('/{databaseId}')
      bh = {
        'method' => req.method.to_s.upcase,
        'path' => path
      }
      params = req.query_parameters

      if req.body_parameters
        params = params.merge(req.body_parameters)
      end
      
      bh['params'] = params if params.size > 0
      bh
    end
  end
end

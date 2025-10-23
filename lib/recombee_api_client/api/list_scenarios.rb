#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'

  ##
  # Get all [Scenarios](https://docs.recombee.com/scenarios) of the given database.
  #
  class ListScenarios < ApiRequest
    attr_accessor :timeout, :ensure_https

    ##
    #
    def initialize
      @timeout = 10_000
      @ensure_https = false
    end

    # HTTP method
    def method
      :get
    end

    # Values of body parameters as a Hash
    def body_parameters
      {}
    end

    # Values of query parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      {}
    end

    # Relative path to the endpoint
    def path
      '/{databaseId}/scenarios/'
    end
  end
end

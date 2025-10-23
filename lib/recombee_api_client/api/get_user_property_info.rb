#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'

  ##
  # Gets information about specified user property.
  #
  class GetUserPropertyInfo < ApiRequest
    attr_reader :property_name
    attr_accessor :timeout, :ensure_https

    ##
    # * *Required arguments*
    #   - +property_name+ -> Name of the property about which the information is to be retrieved.
    #
    def initialize(property_name)
      @property_name = property_name
      @timeout = 100_000
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
      "/{databaseId}/users/properties/#{@property_name}"
    end
  end
end

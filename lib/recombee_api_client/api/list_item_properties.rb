#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'

  ##
  # Gets the list of all the item properties in your database.
  #
  class ListItemProperties < ApiRequest
    attr_accessor :timeout, :ensure_https

    ##
    #
    def initialize
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
      '/{databaseId}/items/properties/list/'
    end
  end
end

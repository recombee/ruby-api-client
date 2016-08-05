#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Deleting an item property is roughly equivalent to removing a column from the table of items.
  #
  class DeleteItemProperty < ApiRequest
    attr_reader :property_name
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +property_name+ -> Name of the property to be deleted.
  #
    def initialize(property_name)
      @property_name = property_name
      @timeout = 1000
      @ensure_https = false
    end
  
    # HTTP method
    def method
      :delete
    end
  
    # Values of body parameters as a Hash
    def body_parameters
      p = Hash.new
      p
    end
  
    # Values of query parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      params = {}
      params
    end
  
    # Relative path to the endpoint
    def path
      "/{databaseId}/items/properties/#{@property_name}"
    end
  end
end

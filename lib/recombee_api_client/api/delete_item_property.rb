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
  
  ##
  # * *Required arguments*
  #   - +property_name+ -> Name of the property to be deleted.
  #
    def initialize(property_name)
      @property_name = property_name
      @timeout = 1000
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
  
    # Values of query path parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      params = {}
      params
    end
  
    # Relative path to the endpoint
    def basic_path
      "/{databaseId}/items/properties/#{@property_name}"
    end
  
    # Relative path to the endpoint including query parameters
    def path
      p = "/{databaseId}/items/properties/#{@property_name}"
      p
    end
  end
end

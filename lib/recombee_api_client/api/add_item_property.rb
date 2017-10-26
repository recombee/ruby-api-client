#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Adding an item property is somehow equivalent to adding a column to the table of items. The items may be characterized by various properties of different types.
  #
  class AddItemProperty < ApiRequest
    attr_reader :property_name, :type
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +property_name+ -> Name of the item property to be created. Currently, the following names are reserved:`id`, `itemid`, case insensitively. Also, the length of the property name must not exceed 63 characters.
  #
  #   - +type+ -> Value type of the item property to be created. One of: `int`, `double`, `string`, `boolean`, `timestamp`, `set`
  #
  #
    def initialize(property_name, type)
      @property_name = property_name
      @type = type
      @timeout = 100000
      @ensure_https = false
    end
  
    # HTTP method
    def method
      :put
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
      params['type'] = @type
      params
    end
  
    # Relative path to the endpoint
    def path
      "/{databaseId}/items/properties/#{@property_name}"
    end
  end
end

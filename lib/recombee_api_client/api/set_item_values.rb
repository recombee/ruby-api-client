#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Set/update (some) property values of a given item. The properties (columns) must be previously created by [Add item property](https://docs.recombee.com/api.html#add-item-property).
  #
  class SetItemValues < ApiRequest
    attr_reader :item_id, :values
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +item_id+ -> ID of the item which will be modified.
  #
  #   - +values+ -> The values for the individual properties.
  #
  #Example of body:
  #```
  #  {
  #    "product_description": "4K TV with 3D feature",
  #    "categories":   ["Electronics", "Televisions"],
  #    "price_usd": 342,
  #    "!cascadeCreate": true
  #  }
  #```
  #
  #Special parameter `!cascadeCreate` may be used. It indicates that the item of the given itemId should be created if it does not exist in the database, as if the corresponding PUT method was used. Note the exclamation mark (!) at the beginning of the parameter's name to distinguish it from item property names.
  #
  #
    def initialize(item_id, values)
      @item_id = item_id
      @values = values
      @timeout = 1000
      @ensure_https = false
    end
  
    # HTTP method
    def method
      :post
    end
  
    # Values of body parameters as a Hash
    def body_parameters
      p = Hash.new
      p = p.merge(@values)
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
      "/{databaseId}/items/#{@item_id}"
    end
  end
end

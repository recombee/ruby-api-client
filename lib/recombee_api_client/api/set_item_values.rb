module RecombeeApiClient
  require_relative 'set_values'
  require_relative '../errors'
  
  ##
  #Set/update (some) property values of a given item. The properties (columns) must be previously created by [Add item property](https://docs.recombee.com/api.html#add-item-property).
  #
  class SetItemValues < SetValues
    attr_reader :item_id
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
  #    "in_stock_from": "2016-11-16T08:00Z",
  #    "!cascadeCreate": true
  #  }
  #```
  #
  #Special parameter `!cascadeCreate` may be used. It indicates that the item of the given itemId should be created if it does not exist in the database, as if the corresponding PUT method was used. Note the exclamation mark (!) at the beginning of the parameter's name to distinguish it from item property names.
  #
  #
  # * *Optional arguments (given as hash optional)*
  #   - +cascadeCreate+ -> Sets whether the item should be created  if not present in the database.
  #
    def initialize(item_id, values, optional = {})
      super(values, optional)
      @item_id = item_id
      @timeout = 1000
      @ensure_https = false
    end
  
    # Relative path to the endpoint
    def path
      "/{databaseId}/items/#{@item_id}"
    end
  end
end

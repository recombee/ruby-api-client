module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Set/update (some) property values of a given entity.
  #
  class SetValues < ApiRequest
    attr_reader :cascade_create, :values
  
  ##
  # * *Required arguments*
  #   - +values+ -> The values for the individual properties.
  #
  #Example of body:
  #```
  #  {
  #    "product_description": "4K TV with 3D feature",
  #    "categories":   ["Electronics", "Televisions"],
  #    "price_usd": 342,
  #    "in_stock_from": "2016-11-16T08:00Z",
  #  }
  #```
  #
  # * *Optional arguments (given as hash optional)*
  #   - +cascadeCreate+ -> Sets whether the item should be created  if not present in the database.
  #
    def initialize( values, optional = {})
      @values = values
      @cascade_create = optional['cascadeCreate']
      @optional = optional
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["cascadeCreate"].include? par
      end
    end
  
    # HTTP method
    def method
      :post
    end
  
    # Values of body parameters as a Hash
    def body_parameters
      result = Hash.new
      result = result.merge(@values)
      result['!cascadeCreate'] = true if @cascade_create
      result
    end
  
    # Values of query parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      Hash.new
    end
  end
end

#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Adds a cart addition of the given item made by the given user.
  #
  class AddCartAddition < ApiRequest
    attr_reader :user_id, :item_id, :timestamp, :cascade_create, :amount, :price, :recomm_id, :additional_data
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +user_id+ -> User who added the item to the cart
  #   - +item_id+ -> Item added to the cart
  #
  # * *Optional arguments (given as hash optional)*
  #   - +timestamp+ -> UTC timestamp of the cart addition as ISO8601-1 pattern or UTC epoch time. The default value is the current time.
  #   - +cascadeCreate+ -> Sets whether the given user/item should be created if not present in the database.
  #   - +amount+ -> Amount (number) added to cart. The default is 1. For example, if `user-x` adds two `item-y` during a single order (session...), the `amount` should equal 2.
  #   - +price+ -> Price of the added item. If `amount` is greater than 1, the sum of prices of all the items should be given.
  #   - +recommId+ -> If this cart addition is based on a recommendation request, `recommId` is the id of the clicked recommendation.
  #   - +additionalData+ -> A dictionary of additional data for the interaction.
  #
    def initialize(user_id, item_id, optional = {})
      @user_id = user_id
      @item_id = item_id
      optional = normalize_optional(optional)
      @timestamp = optional['timestamp']
      @cascade_create = optional['cascadeCreate']
      @amount = optional['amount']
      @price = optional['price']
      @recomm_id = optional['recommId']
      @additional_data = optional['additionalData']
      @optional = optional
      @timeout = 1000
      @ensure_https = false
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["timestamp","cascadeCreate","amount","price","recommId","additionalData"].include? par
      end
    end
  
    # HTTP method
    def method
      :post
    end
  
    # Values of body parameters as a Hash
    def body_parameters
      p = Hash.new
      p['userId'] = @user_id
      p['itemId'] = @item_id
      p['timestamp'] = @optional['timestamp'] if @optional.include? 'timestamp'
      p['cascadeCreate'] = @optional['cascadeCreate'] if @optional.include? 'cascadeCreate'
      p['amount'] = @optional['amount'] if @optional.include? 'amount'
      p['price'] = @optional['price'] if @optional.include? 'price'
      p['recommId'] = @optional['recommId'] if @optional.include? 'recommId'
      p['additionalData'] = @optional['additionalData'] if @optional.include? 'additionalData'
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
      "/{databaseId}/cartadditions/"
    end
  end
end

#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Adds a purchase of the given item made by the given user.
  #
  class AddPurchase < ApiRequest
    attr_reader :user_id, :item_id, :timestamp, :cascade_create, :amount, :price, :profit, :recomm_id, :additional_data
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +user_id+ -> User who purchased the item
  #   - +item_id+ -> Purchased item
  #
  # * *Optional arguments (given as hash optional)*
  #   - +timestamp+ -> UTC timestamp of the purchase as ISO8601-1 pattern or UTC epoch time. The default value is the current time.
  #   - +cascadeCreate+ -> Sets whether the given user/item should be created if not present in the database.
  #   - +amount+ -> Amount (number) of purchased items. The default is 1. For example, if `user-x` purchases two `item-y` during a single order (session...), the `amount` should equal 2.
  #   - +price+ -> Price paid by the user for the item. If `amount` is greater than 1, the sum of prices of all the items should be given.
  #   - +profit+ -> Your profit from the purchased item. The profit is natural in the e-commerce domain (for example, if `user-x` purchases `item-y` for $100 and the gross margin is 30 %, then the profit is $30) but is also applicable in other domains (for example, at a news company it may be income from a displayed advertisement on article page). If `amount` is greater than 1, the sum of profit of all the items should be given.
  #   - +recommId+ -> If this purchase is based on a recommendation request, `recommId` is the id of the clicked recommendation.
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
      @profit = optional['profit']
      @recomm_id = optional['recommId']
      @additional_data = optional['additionalData']
      @optional = optional
      @timeout = 1000
      @ensure_https = false
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["timestamp","cascadeCreate","amount","price","profit","recommId","additionalData"].include? par
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
      p['profit'] = @optional['profit'] if @optional.include? 'profit'
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
      "/{databaseId}/purchases/"
    end
  end
end

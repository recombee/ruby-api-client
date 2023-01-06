#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Sets viewed portion of an item (for example a video or article) by a user (at a session).
  #If you send a new request with the same (`userId`, `itemId`, `sessionId`), the portion gets updated.
  #
  class SetViewPortion < ApiRequest
    attr_reader :user_id, :item_id, :portion, :session_id, :timestamp, :cascade_create, :recomm_id, :additional_data
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +user_id+ -> User who viewed a portion of the item
  #   - +item_id+ -> Viewed item
  #   - +portion+ -> Viewed portion of the item (number between 0.0 (viewed nothing) and 1.0 (viewed full item) ). It should be the actual viewed part of the item, no matter the seeking. For example, if the user seeked immediately to half of the item and then viewed 10% of the item, the `portion` should still be `0.1`.
  #
  # * *Optional arguments (given as hash optional)*
  #   - +sessionId+ -> ID of the session in which the user viewed the item. Default is `null` (`None`, `nil`, `NULL` etc., depending on the language).
  #   - +timestamp+ -> UTC timestamp of the rating as ISO8601-1 pattern or UTC epoch time. The default value is the current time.
  #   - +cascadeCreate+ -> Sets whether the given user/item should be created if not present in the database.
  #   - +recommId+ -> If this view portion is based on a recommendation request, `recommId` is the id of the clicked recommendation.
  #   - +additionalData+ -> A dictionary of additional data for the interaction.
  #
    def initialize(user_id, item_id, portion, optional = {})
      @user_id = user_id
      @item_id = item_id
      @portion = portion
      optional = normalize_optional(optional)
      @session_id = optional['sessionId']
      @timestamp = optional['timestamp']
      @cascade_create = optional['cascadeCreate']
      @recomm_id = optional['recommId']
      @additional_data = optional['additionalData']
      @optional = optional
      @timeout = 1000
      @ensure_https = false
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["sessionId","timestamp","cascadeCreate","recommId","additionalData"].include? par
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
      p['portion'] = @portion
      p['sessionId'] = @optional['sessionId'] if @optional.include? 'sessionId'
      p['timestamp'] = @optional['timestamp'] if @optional.include? 'timestamp'
      p['cascadeCreate'] = @optional['cascadeCreate'] if @optional.include? 'cascadeCreate'
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
      "/{databaseId}/viewportions/"
    end
  end
end

#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Adds a rating of the given item made by the given user.
  #
  class AddRating < ApiRequest
    attr_reader :user_id, :item_id, :timestamp, :rating, :cascade_create, :recomm_id, :additional_data
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +user_id+ -> User who submitted the rating
  #   - +item_id+ -> Rated item
  #   - +rating+ -> Rating rescaled to interval [-1.0,1.0], where -1.0 means the worst rating possible, 0.0 means neutral, and 1.0 means absolutely positive rating. For example, in the case of 5-star evaluations, rating = (numStars-3)/2 formula may be used for the conversion.
  #
  # * *Optional arguments (given as hash optional)*
  #   - +timestamp+ -> UTC timestamp of the rating as ISO8601-1 pattern or UTC epoch time. The default value is the current time.
  #   - +cascadeCreate+ -> Sets whether the given user/item should be created if not present in the database.
  #   - +recommId+ -> If this rating is based on a recommendation request, `recommId` is the id of the clicked recommendation.
  #   - +additionalData+ -> A dictionary of additional data for the interaction.
  #
    def initialize(user_id, item_id, rating, optional = {})
      @user_id = user_id
      @item_id = item_id
      @rating = rating
      optional = normalize_optional(optional)
      @timestamp = optional['timestamp']
      @cascade_create = optional['cascadeCreate']
      @recomm_id = optional['recommId']
      @additional_data = optional['additionalData']
      @optional = optional
      @timeout = 3000
      @ensure_https = false
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["timestamp","cascadeCreate","recommId","additionalData"].include? par
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
      p['rating'] = @rating
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
      "/{databaseId}/ratings/"
    end
  end
end

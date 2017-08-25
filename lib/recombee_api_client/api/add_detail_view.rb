#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Adds a detail view of a given item made by a given user.
  #
  class AddDetailView < ApiRequest
    attr_reader :user_id, :item_id, :timestamp, :duration, :cascade_create
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +user_id+ -> User who viewed the item
  #   - +item_id+ -> Viewed item
  #
  # * *Optional arguments (given as hash optional)*
  #   - +timestamp+ -> UTC timestamp of the view as ISO8601-1 pattern or UTC epoch time. The default value is the current time.
  #   - +duration+ -> Duration of the view
  #   - +cascadeCreate+ -> Sets whether the given user/item should be created if not present in the database.
  #
    def initialize(user_id, item_id, optional = {})
      @user_id = user_id
      @item_id = item_id
      @timestamp = optional['timestamp']
      @duration = optional['duration']
      @cascade_create = optional['cascadeCreate']
      @optional = optional
      @timeout = 1000
      @ensure_https = false
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["timestamp","duration","cascadeCreate"].include? par
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
      p['duration'] = @optional['duration'] if @optional.include? 'duration'
      p['cascadeCreate'] = @optional['cascadeCreate'] if @optional.include? 'cascadeCreate'
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
      "/{databaseId}/detailviews/"
    end
  end
end

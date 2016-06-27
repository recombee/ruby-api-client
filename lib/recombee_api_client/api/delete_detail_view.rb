#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Deletes an existing detail view uniquely specified by (`userId`, `itemId`, and `timestamp`).
  #
  class DeleteDetailView < ApiRequest
    attr_reader :user_id, :item_id, :timestamp
    attr_accessor :timeout
  
  ##
  # * *Required arguments*
  #   - +user_id+ -> ID of the user who made the detail view.
  #   - +item_id+ -> ID of the item of which the details were viewed.
  #
  # * *Optional arguments (given as hash optional)*
  #   - +timestamp+ -> Unix timestamp of the detail view. If the `timestamp` is omitted, then all the detail views with given `userId` and `itemId` are deleted.
  #
    def initialize(user_id, item_id, optional = {})
      @user_id = user_id
      @item_id = item_id
      @timestamp = optional['timestamp']
      @optional = optional
      @timeout = 1000
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["timestamp"].include? par
      end
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
      params['userId'] = @user_id
      params['itemId'] = @item_id
      params['timestamp'] = @optional['timestamp'] if @optional['timestamp']
      params
    end
  
    # Relative path to the endpoint
    def basic_path
      "/{databaseId}/detailviews/"
    end
  
    # Relative path to the endpoint including query parameters
    def path
      p = "/{databaseId}/detailviews/?userId=#{@user_id}&itemId=#{@item_id}"
      if @optional.include? 'timestamp'
        p += (p.include? '?') ? '&' : '?'
        p += "timestamp=#{@optional['timestamp']}"
      end
      p
    end
  end
end

#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #The view portions feature is currently experimental.
  #
  #Deletes an existing view portion specified by (`userId`, `itemId`, `sessionId`) from the database.
  #
  class DeleteViewPortion < ApiRequest
    attr_reader :user_id, :item_id, :session_id
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +user_id+ -> ID of the user who rated the item.
  #   - +item_id+ -> ID of the item which was rated.
  #
  # * *Optional arguments (given as hash optional)*
  #   - +sessionId+ -> Identifier of a session.
  #
    def initialize(user_id, item_id, optional = {})
      @user_id = user_id
      @item_id = item_id
      optional = normalize_optional(optional)
      @session_id = optional['sessionId']
      @optional = optional
      @timeout = 1000
      @ensure_https = false
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["sessionId"].include? par
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
  
    # Values of query parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      params = {}
      params['userId'] = @user_id
      params['itemId'] = @item_id
      params['sessionId'] = @optional['sessionId'] if @optional['sessionId']
      params
    end
  
    # Relative path to the endpoint
    def path
      "/{databaseId}/viewportions/"
    end
  end
end

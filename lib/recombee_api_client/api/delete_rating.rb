#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'

  ##
  # Deletes an existing rating specified by (`userId`, `itemId`, `timestamp`) from the database or all the ratings with the given `userId` and `itemId` if `timestamp` is omitted.
  #
  class DeleteRating < ApiRequest
    attr_reader :user_id, :item_id, :timestamp
    attr_accessor :timeout, :ensure_https

    ##
    # * *Required arguments*
    #   - +user_id+ -> ID of the user who rated the item.
    #   - +item_id+ -> ID of the item which was rated.
    #
    # * *Optional arguments (given as hash optional)*
    #   - +timestamp+ -> Unix timestamp of the rating. If the `timestamp` is omitted, then all the ratings with the given `userId` and `itemId` are deleted.
    #
    def initialize(user_id, item_id, optional = {})
      @user_id = user_id
      @item_id = item_id
      optional = normalize_hash_to_camel_case(optional)
      @timestamp = optional['timestamp']
      @optional = optional
      @timeout = 3000
      @ensure_https = false
      @optional.each do |par, _|
        raise UnknownOptionalParameter.new(par) unless ['timestamp'].include? par
      end
    end

    # HTTP method
    def method
      :delete
    end

    # Values of body parameters as a Hash
    def body_parameters
      {}
    end

    # Values of query parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      params = {}
      params['userId'] = @user_id
      params['itemId'] = @item_id
      params['timestamp'] = @optional['timestamp'] if @optional['timestamp']

      params
    end

    # Relative path to the endpoint
    def path
      '/{databaseId}/ratings/'
    end
  end
end

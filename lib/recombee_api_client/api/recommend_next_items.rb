#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Returns items that shall be shown to a user as next recommendations when the user e.g. scrolls the page down (*infinite scroll*) or goes to the next page.
  #
  #It accepts `recommId` of a base recommendation request (e.g., request from the first page) and the number of items that shall be returned (`count`).
  #The base request can be one of:
  #  - [Recommend items to item](https://docs.recombee.com/api.html#recommend-items-to-item)
  #  - [Recommend items to user](https://docs.recombee.com/api.html#recommend-items-to-user)
  #  - [Search items](https://docs.recombee.com/api.html#search-items)
  #
  #All the other parameters are inherited from the base request.
  #
  #*Recommend next items* can be called many times for a single `recommId` and each call returns different (previously not recommended) items.
  #The number of *Recommend next items* calls performed so far is returned in the `numberNextRecommsCalls` field.
  #
  #*Recommend next items* can be requested up to 30 minutes after the base request or a previous *Recommend next items* call.
  #
  #For billing purposes, each call to *Recommend next items* is counted as a separate recommendation request.
  #
  class RecommendNextItems < ApiRequest
    attr_reader :recomm_id, :count
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +recomm_id+ -> ID of the base recommendation request for which next recommendations should be returned
  #   - +count+ -> Number of items to be recommended
  #
  #
    def initialize(recomm_id, count)
      @recomm_id = recomm_id
      @count = count
      @timeout = 3000
      @ensure_https = false
    end
  
    # HTTP method
    def method
      :post
    end
  
    # Values of body parameters as a Hash
    def body_parameters
      p = Hash.new
      p['count'] = @count
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
      "/{databaseId}/recomms/next/items/#{@recomm_id}"
    end
  end
end

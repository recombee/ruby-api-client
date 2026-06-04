#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'

  ##
  # Returns [Item Segments](https://docs.recombee.com/segmentations) to be shown as the next recommendations when a user scrolls (e.g., within a carousel or feed of Item Segments such as brands, artists, topics, or categories).
  #
  # The request requires the `recommId` of a base recommendation request and the number of Segments to return (`count`).
  #
  # The base request can be one of:
  #  - [Recommend Item Segments to Item](https://docs.recombee.com/api#recommend-item-segments-to-item)
  #  - [Recommend Item Segments to User](https://docs.recombee.com/api#recommend-item-segments-to-user)
  #  - [Recommend Item Segments to Item Segment](https://docs.recombee.com/api#recommend-item-segments-to-item-segment)
  #  - [Search Item Segments](https://docs.recombee.com/api#search-item-segments)
  #
  # All other parameters are inherited from the base request associated with the provided `recommId`.
  #
  # This endpoint can be called multiple times for a single `recommId`. Each call returns different Item Segments that have not been recommended in previous calls.
  # The number of calls made so far is returned in the `numberNextRecommsCalls` field.
  #
  # Requests can be made up to 30 minutes after the base request or the most recent Recommend Next Item Segments call.
  #
  # For billing purposes, each call to this endpoint is counted as a separate recommendation request.
  #
  class RecommendNextItemSegments < ApiRequest
    attr_reader :recomm_id, :count
    attr_accessor :timeout, :ensure_https

    ##
    # * *Required arguments*
    #   - +recomm_id+ -> ID of the base recommendation request for which next recommendations should be returned
    #   - +count+ -> Number of item segments to be recommended
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
      p = {}
      p['count'] = @count

      p
    end

    # Values of query parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      {}
    end

    # Relative path to the endpoint
    def path
      "/{databaseId}/recomms/next/item-segments/#{@recomm_id}"
    end
  end
end

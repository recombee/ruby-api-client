#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'

  ##
  # Lists all the ratings of an item ever submitted by different users.#
  class ListItemRatings < ApiRequest
    attr_reader :item_id
    attr_accessor :timeout, :ensure_https

    ##
    # * *Required arguments*
    #   - +item_id+ -> ID of the item whose ratings are to be listed.
    #
    #
    def initialize(item_id)
      @item_id = item_id
      @timeout = 100_000
      @ensure_https = false
    end

    # HTTP method
    def method
      :get
    end

    # Values of body parameters as a Hash
    def body_parameters
      {}
    end

    # Values of query parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      {}
    end

    # Relative path to the endpoint
    def path
      "/{databaseId}/items/#{@item_id}/ratings/"
    end
  end
end

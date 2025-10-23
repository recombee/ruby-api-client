#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'

  ##
  # Adds new item of the given `itemId` to the items catalog.
  #
  # All the item properties for the newly created items are set to null.
  #
  class AddItem < ApiRequest
    attr_reader :item_id
    attr_accessor :timeout, :ensure_https

    ##
    # * *Required arguments*
    #   - +item_id+ -> ID of the item to be created.
    #
    def initialize(item_id)
      @item_id = item_id
      @timeout = 3000
      @ensure_https = false
    end

    # HTTP method
    def method
      :put
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
      "/{databaseId}/items/#{@item_id}"
    end
  end
end

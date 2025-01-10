#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Removes an existing series item from the series.
  class RemoveFromSeries < ApiRequest
    attr_reader :series_id, :item_type, :item_id
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +series_id+ -> ID of the series from which a series item is to be removed.
  #   - +item_type+ -> Type of the item to be removed.
  #   - +item_id+ -> ID of the item iff `itemType` is `item`. ID of the series iff `itemType` is `series`.
  #
    def initialize(series_id, item_type, item_id)
      @series_id = series_id
      @item_type = item_type
      @item_id = item_id
      @timeout = 3000
      @ensure_https = false
    end
  
    # HTTP method
    def method
      :delete
    end
  
    # Values of body parameters as a Hash
    def body_parameters
      p = Hash.new
      p['itemType'] = @item_type
      p['itemId'] = @item_id
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
      "/{databaseId}/series/#{@series_id}/items/"
    end
  end
end

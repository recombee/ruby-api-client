#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Removes an existing series item from the series.
  class RemoveFromSeries < ApiRequest
    attr_reader :series_id, :item_type, :item_id, :time
    attr_accessor :timeout
  
  ##
  # * *Required arguments*
  #   - +series_id+ -> ID of the series from which a series item is to be removed.
  #   - +item_type+ -> Type of the item to be removed.
  #   - +item_id+ -> ID of the item iff `itemType` is `item`. ID of the series iff `itemType` is `series`.
  #   - +time+ -> Time index of the item to be removed.
  #
    def initialize(series_id, item_type, item_id, time)
      @series_id = series_id
      @item_type = item_type
      @item_id = item_id
      @time = time
      @timeout = 1000
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
      params['itemType'] = @item_type
      params['itemId'] = @item_id
      params['time'] = @time
      params
    end
  
    # Relative path to the endpoint
    def basic_path
      "/{databaseId}/series/#{@series_id}/items/"
    end
  
    # Relative path to the endpoint including query parameters
    def path
      p = "/{databaseId}/series/#{@series_id}/items/?itemType=#{@item_type}&itemId=#{@item_id}&time=#{@time}"
      p
    end
  end
end

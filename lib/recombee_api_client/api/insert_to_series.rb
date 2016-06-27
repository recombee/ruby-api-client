#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Inserts an existing item/series into series of given seriesId at position determined by time.
  #
  class InsertToSeries < ApiRequest
    attr_reader :series_id, :item_type, :item_id, :time, :cascade_create
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +series_id+ -> ID of the series to be inserted into.
  #   - +item_type+ -> `item` iff the regular item from the catalog is to be inserted, `series` iff series is inserted as the item.
  #   - +item_id+ -> ID of the item iff `itemType` is `item`. ID of the series iff `itemType` is `series`.
  #   - +time+ -> Time index used for sorting items in the series. According to time, items are sorted within series in ascending order. In the example of TV show episodes, the episode number is a natural choice to be passed as time.
  #
  # * *Optional arguments (given as hash optional)*
  #   - +cascadeCreate+ -> Indicates that any non-existing entity specified within the request should be created (as is corresponding PUT requests were invoked). This concerns both the `seriesId` and the `itemId`. If `cascadeCreate` is set true, the behavior also depends on the `itemType`. Either item or series may be created if not present in the database.
  #
    def initialize(series_id, item_type, item_id, time, optional = {})
      @series_id = series_id
      @item_type = item_type
      @item_id = item_id
      @time = time
      @cascade_create = optional['cascadeCreate']
      @optional = optional
      @timeout = 1000
      @ensure_https = false
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["cascadeCreate"].include? par
      end
    end
  
    # HTTP method
    def method
      :post
    end
  
    # Values of body parameters as a Hash
    def body_parameters
      p = Hash.new
      p['itemType'] = @item_type
      p['itemId'] = @item_id
      p['time'] = @time
      p['cascadeCreate'] = @optional['cascadeCreate'] if @optional['cascadeCreate']
      p
    end
  
    # Values of query path parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      params = {}
      params
    end
  
    # Relative path to the endpoint
    def basic_path
      "/{databaseId}/series/#{@series_id}/items/"
    end
  
    # Relative path to the endpoint including query parameters
    def path
      p = "/{databaseId}/series/#{@series_id}/items/"
      p
    end
  end
end

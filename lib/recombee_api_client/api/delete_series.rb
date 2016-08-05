#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Deletes the series of given `seriesId` from the database.
  #
  #Deleting a series will only delete assignment of items to it, not the items themselves!
  #
  class DeleteSeries < ApiRequest
    attr_reader :series_id
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +series_id+ -> ID of the series to be deleted.
  #
    def initialize(series_id)
      @series_id = series_id
      @timeout = 1000
      @ensure_https = false
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
      params
    end
  
    # Relative path to the endpoint
    def path
      "/{databaseId}/series/#{@series_id}"
    end
  end
end

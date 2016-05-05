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
  
  ##
  # * *Required arguments*
  #   - +series_id+ -> ID of the series to be deleted.
  #
    def initialize(series_id)
      @series_id = series_id
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
      params
    end
  
    # Relative path to the endpoint
    def basic_path
      "/{databaseId}/series/#{@series_id}"
    end
  
    # Relative path to the endpoint including query parameters
    def path
      p = "/{databaseId}/series/#{@series_id}"
      p
    end
  end
end

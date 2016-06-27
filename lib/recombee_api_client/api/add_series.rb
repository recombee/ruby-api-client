#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Creates new series in the database.
  class AddSeries < ApiRequest
    attr_reader :series_id
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +series_id+ -> ID of the series to be created.
  #
    def initialize(series_id)
      @series_id = series_id
      @timeout = 1000
      @ensure_https = false
    end
  
    # HTTP method
    def method
      :put
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

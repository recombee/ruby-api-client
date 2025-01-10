#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Creates a new series in the database.
  class AddSeries < ApiRequest
    attr_reader :series_id, :cascade_create
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +series_id+ -> ID of the series to be created.
  #
  # * *Optional arguments (given as hash optional)*
  #   - +cascadeCreate+ -> If set to `true`, the item will be created with the same ID as the series. Default is `true`.
  #
    def initialize(series_id, optional = {})
      @series_id = series_id
      optional = normalize_optional(optional)
      @cascade_create = optional['cascadeCreate']
      @optional = optional
      @timeout = 3000
      @ensure_https = false
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["cascadeCreate"].include? par
      end
    end
  
    # HTTP method
    def method
      :put
    end
  
    # Values of body parameters as a Hash
    def body_parameters
      p = Hash.new
      p['cascadeCreate'] = @optional['cascadeCreate'] if @optional.include? 'cascadeCreate'
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

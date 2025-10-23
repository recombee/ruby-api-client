#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'

  ##
  # Deletes the series of the given `seriesId` from the database.
  #
  # Deleting a series will only delete assignment of items to it, not the items themselves!
  #
  class DeleteSeries < ApiRequest
    attr_reader :series_id, :cascade_delete
    attr_accessor :timeout, :ensure_https

    ##
    # * *Required arguments*
    #   - +series_id+ -> ID of the series to be deleted.
    #
    # * *Optional arguments (given as hash optional)*
    #   - +cascadeDelete+ -> If set to `true`, item with the same ID as seriesId will be also deleted. Default is `false`.
    #
    def initialize(series_id, optional = {})
      @series_id = series_id
      optional = normalize_hash_to_camel_case(optional)
      @cascade_delete = optional['cascadeDelete']
      @optional = optional
      @timeout = 3000
      @ensure_https = false
      @optional.each do |par, _|
        raise UnknownOptionalParameter.new(par) unless ['cascadeDelete'].include? par
      end
    end

    # HTTP method
    def method
      :delete
    end

    # Values of body parameters as a Hash
    def body_parameters
      p = {}
      p['cascadeDelete'] = @optional['cascadeDelete'] if @optional.include? 'cascadeDelete'

      p
    end

    # Values of query parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      {}
    end

    # Relative path to the endpoint
    def path
      "/{databaseId}/series/#{@series_id}"
    end
  end
end

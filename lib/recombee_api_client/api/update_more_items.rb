#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'

  ##
  # Updates (some) property values of all the items that pass the filter.
  #
  # Example: *Setting all the items that are older than a week as unavailable*
  #
  #  ```json
  #    {
  #      "filter": "'releaseDate' < now() - 7*24*3600",
  #      "changes": {"available": false}
  #    }
  #  ```
  #
  class UpdateMoreItems < ApiRequest
    attr_reader :filter, :changes
    attr_accessor :timeout, :ensure_https

    ##
    # * *Required arguments*
    #   - +filter+ -> A [ReQL](https://docs.recombee.com/reql) expression, which returns `true` for the items that shall be updated.
    #   - +changes+ -> A dictionary where the keys are properties that shall be updated.
    #
    def initialize(filter, changes)
      @filter = filter
      @changes = changes
      @timeout = 100_000
      @ensure_https = false
    end

    # HTTP method
    def method
      :post
    end

    # Values of body parameters as a Hash
    def body_parameters
      p = {}
      p['filter'] = @filter
      p['changes'] = @changes

      p
    end

    # Values of query parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      {}
    end

    # Relative path to the endpoint
    def path
      '/{databaseId}/more-items/'
    end
  end
end

#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'

  ##
  # Deletes all the items that pass the filter.
  #
  # If an item becomes obsolete/no longer available, it is meaningful to **keep it in the catalog** (along with all the interaction data, which are very useful) and **only exclude the item from recommendations**. In such a case, use [ReQL filter](https://docs.recombee.com/reql) instead of deleting the item completely.#
  class DeleteMoreItems < ApiRequest
    attr_reader :filter
    attr_accessor :timeout, :ensure_https

    ##
    # * *Required arguments*
    #   - +filter+ -> A [ReQL](https://docs.recombee.com/reql) expression, which returns `true` for the items that shall be updated.
    #
    def initialize(filter)
      @filter = filter
      @timeout = 100_000
      @ensure_https = false
    end

    # HTTP method
    def method
      :delete
    end

    # Values of body parameters as a Hash
    def body_parameters
      p = {}
      p['filter'] = @filter

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

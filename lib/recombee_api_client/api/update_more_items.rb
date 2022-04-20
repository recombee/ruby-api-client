#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Update (some) property values of all the items that pass the filter.
  #
  #Example: *Setting all the items that are older than a week as unavailable*
  #
  #  ```
  #    {
  #      "filter": "'releaseDate' < now() - 7*24*3600",
  #      "changes": {"available": false}
  #    }
  #  ```
  #
  class UpdateMoreItems < ApiRequest
    attr_reader :filter, :changes
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +filter+ -> A [ReQL](https://docs.recombee.com/reql.html) expression, which return `true` for the items that shall be updated.
  #   - +changes+ -> A dictionary where the keys are properties which shall be updated.
  #
    def initialize(filter, changes)
      @filter = filter
      @changes = changes
      @timeout = 1000
      @ensure_https = false
    end
  
    # HTTP method
    def method
      :post
    end
  
    # Values of body parameters as a Hash
    def body_parameters
      p = Hash.new
      p['filter'] = @filter
      p['changes'] = @changes
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
      "/{databaseId}/more-items/"
    end
  end
end

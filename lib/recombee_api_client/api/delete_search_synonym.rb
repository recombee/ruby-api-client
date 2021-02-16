#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Deletes synonym of given `id` and this synonym is no longer taken into account in the [Search items](https://docs.recombee.com/api.html#search-items).
  #
  class DeleteSearchSynonym < ApiRequest
    attr_reader :id
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +id+ -> ID of the synonym that should be deleted.
  #
    def initialize(id)
      @id = id
      @timeout = 10000
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
      "/{databaseId}/synonyms/items/#{@id}"
    end
  end
end

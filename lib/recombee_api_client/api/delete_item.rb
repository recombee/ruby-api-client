#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Deletes an item of given `itemId` from the catalog.
  #
  #If there are any *purchases*, *ratings*, *bookmarks*, *cart additions* or *detail views* of the item present in the database, they will be deleted in cascade as well. Also, if the item is present in some *series*, it will be removed from all the *series* where present.
  #
  #If an item becomes obsolete/no longer available, it is often meaningful to keep it in the catalog (along with all the interaction data, which are very useful), and only exclude the item from recommendations. In such a case, use [ReQL filter](https://docs.recombee.com/reql.html) instead of deleting the item completely.
  #
  class DeleteItem < ApiRequest
    attr_reader :item_id
    attr_accessor :timeout
  
  ##
  # * *Required arguments*
  #   - +item_id+ -> ID of the item to be deleted.
  #
    def initialize(item_id)
      @item_id = item_id
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
      "/{databaseId}/items/#{@item_id}"
    end
  
    # Relative path to the endpoint including query parameters
    def path
      p = "/{databaseId}/items/#{@item_id}"
      p
    end
  end
end

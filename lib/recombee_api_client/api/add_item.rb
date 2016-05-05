#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Adds new item of given `itemId` to the items catalog.
  #
  #All the item properties for the newly created items are set null.
  #
  class AddItem < ApiRequest
    attr_reader :item_id
    attr_accessor :timeout
  
  ##
  # * *Required arguments*
  #   - +item_id+ -> ID of the item to be created.
  #
    def initialize(item_id)
      @item_id = item_id
      @timeout = 1000
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
      "/{databaseId}/items/#{@item_id}"
    end
  
    # Relative path to the endpoint including query parameters
    def path
      p = "/{databaseId}/items/#{@item_id}"
      p
    end
  end
end

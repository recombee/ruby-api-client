#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Get all the current property values of a given item.
  #
  class GetItemValues < ApiRequest
    attr_reader :item_id
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +item_id+ -> ID of the item properties of which are to be obtained.
  #
  #
    def initialize(item_id)
      @item_id = item_id
      @timeout = 1000
      @ensure_https = false
    end
  
    # HTTP method
    def method
      :get
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

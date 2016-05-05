#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Removes an existing group item from the group.
  class RemoveFromGroup < ApiRequest
    attr_reader :group_id, :item_type, :item_id
    attr_accessor :timeout
  
  ##
  # * *Required arguments*
  #   - +group_id+ -> ID of the group from which a group item is to be removed.
  #   - +item_type+ -> Type of the item to be removed.
  #   - +item_id+ -> ID of the item iff `itemType` is `item`. ID of the group iff `itemType` is `group`.
  #
    def initialize(group_id, item_type, item_id)
      @group_id = group_id
      @item_type = item_type
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
      params['itemType'] = @item_type
      params['itemId'] = @item_id
      params
    end
  
    # Relative path to the endpoint
    def basic_path
      "/{databaseId}/groups/#{@group_id}/items/"
    end
  
    # Relative path to the endpoint including query parameters
    def path
      p = "/{databaseId}/groups/#{@group_id}/items/?itemType=#{@item_type}&itemId=#{@item_id}"
      p
    end
  end
end

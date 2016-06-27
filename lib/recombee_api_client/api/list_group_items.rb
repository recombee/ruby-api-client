#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #List all the items present in the given group.
  class ListGroupItems < ApiRequest
    attr_reader :group_id
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +group_id+ -> ID of the group items of which are to be listed.
  #
    def initialize(group_id)
      @group_id = group_id
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
      "/{databaseId}/groups/#{@group_id}/items/"
    end
  
    # Relative path to the endpoint including query parameters
    def path
      p = "/{databaseId}/groups/#{@group_id}/items/"
      p
    end
  end
end

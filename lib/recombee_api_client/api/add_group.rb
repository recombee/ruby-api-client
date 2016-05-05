#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Creates new group in the database.
  class AddGroup < ApiRequest
    attr_reader :group_id
    attr_accessor :timeout
  
  ##
  # * *Required arguments*
  #   - +group_id+ -> ID of the group to be created.
  #
    def initialize(group_id)
      @group_id = group_id
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
      "/{databaseId}/groups/#{@group_id}"
    end
  
    # Relative path to the endpoint including query parameters
    def path
      p = "/{databaseId}/groups/#{@group_id}"
      p
    end
  end
end

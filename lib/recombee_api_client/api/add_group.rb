#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Creates a new group in the database.
  class AddGroup < ApiRequest
    attr_reader :group_id
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +group_id+ -> ID of the group to be created.
  #
    def initialize(group_id)
      @group_id = group_id
      @timeout = 1000
      @ensure_https = false
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
  
    # Values of query parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      params = {}
      params
    end
  
    # Relative path to the endpoint
    def path
      "/{databaseId}/groups/#{@group_id}"
    end
  end
end

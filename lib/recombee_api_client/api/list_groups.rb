#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Gets the list of all the groups currently present in the database.
  class ListGroups < ApiRequest
  
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  #
    def initialize()
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
      "/{databaseId}/groups/list/"
    end
  
    # Relative path to the endpoint including query parameters
    def path
      p = "/{databaseId}/groups/list/"
      p
    end
  end
end

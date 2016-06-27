#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Completely erases all your data, including items, item properties, series, user database, purchases, ratings, detail views, and bookmarks. Make sure the request to be never executed in production environment! Resetting your database is irreversible.
  #
  class ResetDatabase < ApiRequest
  
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  #
    def initialize()
      @timeout = 5000
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
  
    # Values of query path parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      params = {}
      params
    end
  
    # Relative path to the endpoint
    def basic_path
      "/{databaseId}/"
    end
  
    # Relative path to the endpoint including query parameters
    def path
      p = "/{databaseId}/"
      p
    end
  end
end

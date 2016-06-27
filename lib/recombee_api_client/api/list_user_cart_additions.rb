#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #List all the cart additions ever made by a given user.
  class ListUserCartAdditions < ApiRequest
    attr_reader :user_id
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +user_id+ -> ID of the user whose cart additions are to be listed.
  #
    def initialize(user_id)
      @user_id = user_id
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
      "/{databaseId}/users/#{@user_id}/cartadditions/"
    end
  
    # Relative path to the endpoint including query parameters
    def path
      p = "/{databaseId}/users/#{@user_id}/cartadditions/"
      p
    end
  end
end

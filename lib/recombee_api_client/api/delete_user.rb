#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Deletes a user of given *userId* from the database.
  #
  #If there are any purchases, ratings, bookmarks, cart additions or detail views made by the user present in the database, they will be deleted in cascade as well.
  #
  class DeleteUser < ApiRequest
    attr_reader :user_id
    attr_accessor :timeout
  
  ##
  # * *Required arguments*
  #   - +user_id+ -> ID of the user to be added.
  #
    def initialize(user_id)
      @user_id = user_id
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
      "/{databaseId}/users/#{@user_id}"
    end
  
    # Relative path to the endpoint including query parameters
    def path
      p = "/{databaseId}/users/#{@user_id}"
      p
    end
  end
end

#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Merges purchases, ratings, bookmarks, and detail views of two different users under a single user ID. This is especially useful for online e-commerce applications working with anonymous users identified by unique tokens such as the session ID. In such applications, it may often happen that a user owns a persistent account, yet accesses the system anonymously while, e.g., putting items into a shopping cart. At some point in time, such as when the user wishes to confirm the purchase, (s)he logs into the system using his/her username and password. The interactions made under anonymous session ID then become connected with the persistent account, and merging these two together becomes desirable.
  #
  #
  #Merging happens between two users referred to as the *source* and the *target*. After the merge, all the interactions of the source user are attributed to the target user, and the source user is **deleted** unless special parameter `keepSourceUser` is set `true`.
  #
  class MergeUsers < ApiRequest
    attr_reader :target_user_id, :source_user_id, :keep_source_user
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +target_user_id+ -> ID of the source user.
  #   - +source_user_id+ -> ID of the target user.
  #
  # * *Optional arguments (given as hash optional)*
  #   - +keepSourceUser+ -> If true, the source user will not be deleted, but also kept in the database..
  #
    def initialize(target_user_id, source_user_id, optional = {})
      @target_user_id = target_user_id
      @source_user_id = source_user_id
      @keep_source_user = optional['keepSourceUser']
      @optional = optional
      @timeout = 1000
      @ensure_https = false
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["keepSourceUser"].include? par
      end
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
      params['keepSourceUser'] = @optional['keepSourceUser'] if @optional['keepSourceUser']
      params
    end
  
    # Relative path to the endpoint
    def path
      "/{databaseId}/users/#{@target_user_id}/merge/#{@source_user_id}"
    end
  end
end

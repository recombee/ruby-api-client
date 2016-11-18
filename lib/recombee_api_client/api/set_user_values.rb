#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Set/update (some) property values of a given user. The properties (columns) must be previously created by [Add user property](https://docs.recombee.com/api.html#add-user-property).
  #
  class SetUserValues < ApiRequest
    attr_reader :user_id, :values
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +user_id+ -> ID of the user which will be modified.
  #
  #   - +values+ -> The values for the individual properties.
  #
  #Example of body:
  #```
  #  {
  #    "country": "US",
  #    "sex": "F",
  #    "!cascadeCreate": true
  #  }
  #```
  #
  #Special parameter `!cascadeCreate` may be used. It indicates that the user of the given userId should be created if it does not exist in the database, as if the corresponding PUT method was used. Note the exclamation mark (!) at the beginning of the parameter's name to distinguish it from user property names.
  #
  #
    def initialize(user_id, values)
      @user_id = user_id
      @values = values
      @timeout = 1000
      @ensure_https = false
    end
  
    # HTTP method
    def method
      :post
    end
  
    # Values of body parameters as a Hash
    def body_parameters
      p = Hash.new
      p = p.merge(@values)
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
      "/{databaseId}/users/#{@user_id}"
    end
  end
end

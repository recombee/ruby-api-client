#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Gets a list of IDs of users currently present in the catalog.
  class ListUsers < ApiRequest
    attr_reader :filter, :count, :offset, :return_properties, :included_properties
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  #
  # * *Optional arguments (given as hash optional)*
  #   - +filter+ -> Boolean-returning [ReQL](https://docs.recombee.com/reql.html) expression, which allows you to filter users to be listed. Only the users for which the expression is *true* will be returned.
  #   - +count+ -> The number of users to be listed.
  #   - +offset+ -> Specifies the number of users to skip (ordered by `userId`).
  #   - +returnProperties+ -> With `returnProperties=true`, property values of the listed users are returned along with their IDs in a JSON dictionary. 
  #
  #Example response:
  #```
  #  [
  #    {
  #      "userId": "user-81",
  #      "country": "US",
  #      "sex": "M"
  #    },
  #    {
  #      "userId": "user-314",
  #      "country": "CAN",
  #      "sex": "F"
  #    }
  #  ]
  #```
  #
  #   - +includedProperties+ -> Allows to specify, which properties should be returned when `returnProperties=true` is set. The properties are given as a comma-separated list. 
  #
  #Example response for `includedProperties=country`:
  #```
  #  [
  #    {
  #      "userId": "user-81",
  #      "country": "US"
  #    },
  #    {
  #      "userId": "user-314",
  #      "country": "CAN"
  #    }
  #  ]
  #```
  #
  #
    def initialize(optional = {})
      optional = normalize_optional(optional)
      @filter = optional['filter']
      @count = optional['count']
      @offset = optional['offset']
      @return_properties = optional['returnProperties']
      @included_properties = optional['includedProperties']
      @optional = optional
      @timeout = 100000
      @ensure_https = false
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["filter","count","offset","returnProperties","includedProperties"].include? par
      end
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
  
    # Values of query parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      params = {}
      params['filter'] = @optional['filter'] if @optional['filter']
      params['count'] = @optional['count'] if @optional['count']
      params['offset'] = @optional['offset'] if @optional['offset']
      params['returnProperties'] = @optional['returnProperties'] if @optional['returnProperties']
      params['includedProperties'] = @optional['includedProperties'] if @optional['includedProperties']
      params
    end
  
    # Relative path to the endpoint
    def path
      "/{databaseId}/users/list/"
    end
  end
end

#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Gets a list of IDs of items currently present in the catalog.
  class ListItems < ApiRequest
    attr_reader :filter, :count, :offset, :return_properties, :included_properties
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  #
  # * *Optional arguments (given as hash optional)*
  #   - +filter+ -> Boolean-returning [ReQL](https://docs.recombee.com/reql.html) expression, which allows you to filter items to be listed. Only the items for which the expression is *true* will be returned.
  #   - +count+ -> The number of items to be listed.
  #   - +offset+ -> Specifies the number of items to skip (ordered by `itemId`).
  #   - +returnProperties+ -> With `returnProperties=true`, property values of the listed items are returned along with their IDs in a JSON dictionary. 
  #
  #Example response:
  #```
  #  [
  #    {
  #      "itemId": "tv-178",
  #      "description": "4K TV with 3D feature",
  #      "categories":   ["Electronics", "Televisions"],
  #      "price": 342,
  #      "url": "myshop.com/tv-178"
  #    },
  #    {
  #      "itemId": "mixer-42",
  #      "description": "Stainless Steel Mixer",
  #      "categories":   ["Home & Kitchen"],
  #      "price": 39,
  #      "url": "myshop.com/mixer-42"
  #    }
  #  ]
  #```
  #
  #   - +includedProperties+ -> Allows to specify, which properties should be returned when `returnProperties=true` is set. The properties are given as a comma-separated list. 
  #
  #Example response for `includedProperties=description,price`:
  #```
  #  [
  #    {
  #      "itemId": "tv-178",
  #      "description": "4K TV with 3D feature",
  #      "price": 342
  #    },
  #    {
  #      "itemId": "mixer-42",
  #      "description": "Stainless Steel Mixer",
  #      "price": 39
  #    }
  #  ]
  #```
  #
  #
    def initialize(optional = {})
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
      "/{databaseId}/items/list/"
    end
  end
end

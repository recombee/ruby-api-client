#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Adds a new synonym for the [Search items](https://docs.recombee.com/api.html#search-items).
  #
  #When the `term` is used in the search query, the `synonym` is also used for the full-text search.
  #Unless `oneWay=true`, it works also in the opposite way (`synonym` -> `term`).
  #
  #An example of a synonym can be `science fiction` for the term `sci-fi`.
  #
  class AddSearchSynonym < ApiRequest
    attr_reader :term, :synonym, :one_way
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +term+ -> A word to which the `synonym` is specified.
  #   - +synonym+ -> A word that should be considered equal to the `term` by the full-text search engine.
  #
  # * *Optional arguments (given as hash optional)*
  #   - +oneWay+ -> If set to `true`, only `term` -> `synonym` is considered. If set to `false`, also `synonym` -> `term` works.
  #
  #Default: `false`.
  #
  #
    def initialize(term, synonym, optional = {})
      @term = term
      @synonym = synonym
      optional = normalize_optional(optional)
      @one_way = optional['oneWay']
      @optional = optional
      @timeout = 10000
      @ensure_https = false
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["oneWay"].include? par
      end
    end
  
    # HTTP method
    def method
      :post
    end
  
    # Values of body parameters as a Hash
    def body_parameters
      p = Hash.new
      p['term'] = @term
      p['synonym'] = @synonym
      p['oneWay'] = @optional['oneWay'] if @optional.include? 'oneWay'
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
      "/{databaseId}/synonyms/items/"
    end
  end
end

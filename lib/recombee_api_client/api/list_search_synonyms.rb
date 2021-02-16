#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Gives the list of synonyms defined in the database.
  class ListSearchSynonyms < ApiRequest
    attr_reader :count, :offset
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  #
  # * *Optional arguments (given as hash optional)*
  #   - +count+ -> The number of synonyms to be listed.
  #   - +offset+ -> Specifies the number of synonyms to skip (ordered by `term`).
  #
    def initialize(optional = {})
      optional = normalize_optional(optional)
      @count = optional['count']
      @offset = optional['offset']
      @optional = optional
      @timeout = 100000
      @ensure_https = false
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["count","offset"].include? par
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
      params['count'] = @optional['count'] if @optional['count']
      params['offset'] = @optional['offset'] if @optional['offset']
      params
    end
  
    # Relative path to the endpoint
    def path
      "/{databaseId}/synonyms/items/"
    end
  end
end

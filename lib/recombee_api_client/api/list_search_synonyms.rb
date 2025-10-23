#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'

  ##
  # Gives the list of synonyms defined in the database.#
  class ListSearchSynonyms < ApiRequest
    attr_reader :count, :offset
    attr_accessor :timeout, :ensure_https

    ##
    #
    # * *Optional arguments (given as hash optional)*
    #   - +count+ -> The number of synonyms to be listed.
    #   - +offset+ -> Specifies the number of synonyms to skip (ordered by `term`).
    #
    def initialize(optional = {})
      optional = normalize_hash_to_camel_case(optional)
      @count = optional['count']
      @offset = optional['offset']
      @optional = optional
      @timeout = 100_000
      @ensure_https = false
      @optional.each do |par, _|
        raise UnknownOptionalParameter.new(par) unless %w[count offset].include? par
      end
    end

    # HTTP method
    def method
      :get
    end

    # Values of body parameters as a Hash
    def body_parameters
      {}
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
      '/{databaseId}/synonyms/items/'
    end
  end
end

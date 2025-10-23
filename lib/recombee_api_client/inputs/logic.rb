#
# This file is auto-generated, do not edit
#

require 'json'

module RecombeeApiClient
  require_relative 'input'
  require_relative '../errors'

  ##
  # Initializes Logic input#
  class Logic < Input
    attr_reader :name, :settings

    ##
    #
    # * *Optional arguments (given as hash optional)*
    #   - +name+ -> Name of the logic that should be used
    #   - +settings+ -> Parameters passed to the logic
    #
    def initialize(optional = {})
      optional = normalize_hash_to_camel_case(optional)
      @name = optional['name']
      @settings = optional['settings']
      @optional = optional
      @optional.each do |par, _|
        raise UnknownOptionalParameter.new(par) unless %w[name settings].include? par
      end
    end

    # Return only JSON-serializable primitives.
    def as_json(_options = {})
      res = {}
      res['name'] = @optional['name'] if @optional['name']
      res['settings'] = @optional['settings'] if @optional['settings']

      res
    end

    def to_json(*args)
      as_json.to_json(*args)
    end
  end
end

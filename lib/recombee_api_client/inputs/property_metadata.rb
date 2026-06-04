#
# This file is auto-generated, do not edit
#

require 'json'

module RecombeeApiClient
  require_relative 'input'
  require_relative '../errors'

  ##
  # Initializes PropertyMetadata input#
  class PropertyMetadata < Input
    attr_reader :name, :settings

    ##
    # * *Required arguments*
    #   - +name+ -> Name of the [metadata](https://docs.recombee.com/api/property_roles_metadata#metadata) assigned to the property.
    #
    # * *Optional arguments (given as hash optional)*
    #   - +settings+ -> Optional configuration for this metadata entry.
    #
    def initialize(name, optional = {})
      @name = name
      optional = normalize_hash_to_camel_case(optional)
      @settings = optional['settings']
      @optional = optional
      @optional.each do |par, _|
        raise UnknownOptionalParameter.new(par) unless ['settings'].include? par
      end
    end

    # Return only JSON-serializable primitives.
    def as_json(_options = {})
      res = {}
      res['name'] = @name
      res['settings'] = @optional['settings'] if @optional['settings']

      res
    end

    def to_json(*args)
      as_json.to_json(*args)
    end
  end
end

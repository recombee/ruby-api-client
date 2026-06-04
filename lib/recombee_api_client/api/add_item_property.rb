#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'

  ##
  # Adding an item property is somewhat equivalent to adding a column to the table of items. The items may be characterized by various properties of different types.
  #
  class AddItemProperty < ApiRequest
    attr_reader :property_name, :type, :role, :metadata
    attr_accessor :timeout, :ensure_https

    ##
    # * *Required arguments*
    #   - +property_name+ -> Name of the item property to be created. Currently, the following names are reserved: `id`, `itemid`, case-insensitively. Also, the length of the property name must not exceed 63 characters.
    #
    #   - +type+ -> Value type of the item property to be created. One of: `int`, `double`, `string`, `boolean`, `timestamp`, `set`, `image` or `imageList`.
    #
    # * `int` - Signed integer number.
    #
    # * `double` - Floating point number. It uses 64-bit base-2 format (IEEE 754 standard).
    #
    # * `string` - UTF-8 string.
    #
    # * `boolean` - *true* / *false*
    #
    # * `timestamp` - Value representing date and time. ISO8601-1 pattern (string) or UTC epoch time (number).
    #
    # * `set` - Set of strings.
    #
    # * `image` - URL of an image (`jpeg`, `png` or `gif`).
    #
    # * `imageList` - List of URLs that refer to images.
    #
    #
    # * *Optional arguments (given as hash optional)*
    #   - +role+ -> [Role](https://docs.recombee.com/api/property_roles_metadata#roles) to assign to the property.
    #
    #   - +metadata+ -> List of [metadata](https://docs.recombee.com/api/property_roles_metadata#metadata) entries to assign to the property.
    #
    def initialize(property_name, type, optional = {})
      @property_name = property_name
      @type = type
      optional = normalize_hash_to_camel_case(optional)
      @role = optional['role']
      @metadata = optional['metadata']
      @optional = optional
      @timeout = 100_000
      @ensure_https = false
      @optional.each do |par, _|
        raise UnknownOptionalParameter.new(par) unless %w[role metadata].include? par
      end
    end

    # HTTP method
    def method
      :put
    end

    # Values of body parameters as a Hash
    def body_parameters
      p = {}
      p['type'] = @type
      p['role'] = @optional['role'] if @optional.include? 'role'
      p['metadata'] = @optional['metadata'] if @optional.include? 'metadata'

      p
    end

    # Values of query parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      {}
    end

    # Relative path to the endpoint
    def path
      "/{databaseId}/items/properties/#{@property_name}"
    end
  end
end

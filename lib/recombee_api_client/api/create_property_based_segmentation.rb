#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Creates a Segmentation that splits the items into segments based on values of a particular item property.
  #
  #A segment is created for each unique value of the property.
  #In case of `set` properties, a segment is created for each value in the set. Item belongs to all these segments.
  #
  class CreatePropertyBasedSegmentation < ApiRequest
    attr_reader :segmentation_id, :source_type, :property_name, :title, :description
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +segmentation_id+ -> ID of the newly created Segmentation
  #   - +source_type+ -> What type of data should be segmented. Currently only `items` are supported.
  #
  #   - +property_name+ -> Name of the property on which the Segmentation should be based
  #
  #
  # * *Optional arguments (given as hash optional)*
  #   - +title+ -> Human-readable name that is shown in the Recombee Admin UI.
  #
  #   - +description+ -> Description that is shown in the Recombee Admin UI.
  #
  #
    def initialize(segmentation_id, source_type, property_name, optional = {})
      @segmentation_id = segmentation_id
      @source_type = source_type
      @property_name = property_name
      optional = normalize_optional(optional)
      @title = optional['title']
      @description = optional['description']
      @optional = optional
      @timeout = 10000
      @ensure_https = false
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["title","description"].include? par
      end
    end
  
    # HTTP method
    def method
      :put
    end
  
    # Values of body parameters as a Hash
    def body_parameters
      p = Hash.new
      p['sourceType'] = @source_type
      p['propertyName'] = @property_name
      p['title'] = @optional['title'] if @optional.include? 'title'
      p['description'] = @optional['description'] if @optional.include? 'description'
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
      "/{databaseId}/segmentations/property-based/#{@segmentation_id}"
    end
  end
end

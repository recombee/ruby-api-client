#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Updates a Property Based Segmentation
  #
  class UpdatePropertyBasedSegmentation < ApiRequest
    attr_reader :segmentation_id, :property_name, :title, :description
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +segmentation_id+ -> ID of the updated Segmentation
  #
  # * *Optional arguments (given as hash optional)*
  #   - +propertyName+ -> Name of the property on which the Segmentation should be based
  #
  #   - +title+ -> Human-readable name that is shown in the Recombee Admin UI.
  #
  #   - +description+ -> Description that is shown in the Recombee Admin UI.
  #
  #
    def initialize(segmentation_id, optional = {})
      @segmentation_id = segmentation_id
      optional = normalize_optional(optional)
      @property_name = optional['propertyName']
      @title = optional['title']
      @description = optional['description']
      @optional = optional
      @timeout = 10000
      @ensure_https = false
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["propertyName","title","description"].include? par
      end
    end
  
    # HTTP method
    def method
      :post
    end
  
    # Values of body parameters as a Hash
    def body_parameters
      p = Hash.new
      p['propertyName'] = @optional['propertyName'] if @optional.include? 'propertyName'
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

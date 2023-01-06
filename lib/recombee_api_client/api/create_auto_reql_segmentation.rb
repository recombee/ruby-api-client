#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Segment the items using a [ReQL](https://docs.recombee.com/reql.html) expression.
  #
  #For each item, the expression should return a set that contains IDs of segments to which the item belongs to.
  #
  class CreateAutoReqlSegmentation < ApiRequest
    attr_reader :segmentation_id, :source_type, :expression, :title, :description
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +segmentation_id+ -> ID of the newly created Segmentation
  #   - +source_type+ -> What type of data should be segmented. Currently only `items` are supported.
  #
  #   - +expression+ -> ReQL expression that returns for each item a set with IDs of segments to which the item belongs
  #
  #
  # * *Optional arguments (given as hash optional)*
  #   - +title+ -> Human-readable name that is shown in the Recombee Admin UI.
  #
  #   - +description+ -> Description that is shown in the Recombee Admin UI.
  #
  #
    def initialize(segmentation_id, source_type, expression, optional = {})
      @segmentation_id = segmentation_id
      @source_type = source_type
      @expression = expression
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
      p['expression'] = @expression
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
      "/{databaseId}/segmentations/auto-reql/#{@segmentation_id}"
    end
  end
end

#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Segment the items using multiple [ReQL](https://docs.recombee.com/reql.html) filters.
  #
  #Use the Add Manual ReQL Items Segment endpoint to create the individual segments.
  #
  class CreateManualReqlSegmentation < ApiRequest
    attr_reader :segmentation_id, :source_type, :title, :description
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +segmentation_id+ -> ID of the newly created Segmentation
  #   - +source_type+ -> What type of data should be segmented. Currently only `items` are supported.
  #
  #
  # * *Optional arguments (given as hash optional)*
  #   - +title+ -> Human-readable name that is shown in the Recombee Admin UI.
  #
  #   - +description+ -> Description that is shown in the Recombee Admin UI.
  #
  #
    def initialize(segmentation_id, source_type, optional = {})
      @segmentation_id = segmentation_id
      @source_type = source_type
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
      "/{databaseId}/segmentations/manual-reql/#{@segmentation_id}"
    end
  end
end

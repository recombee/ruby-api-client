#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Update definition of the Segment.
  #
  class UpdateManualReqlSegment < ApiRequest
    attr_reader :segmentation_id, :segment_id, :filter, :title
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +segmentation_id+ -> ID of the Segmentation to which the updated Segment belongs
  #   - +segment_id+ -> ID of the Segment that will be updated
  #   - +filter+ -> ReQL filter that returns `true` for items that belong to this Segment. Otherwise returns `false`.
  #
  #
  # * *Optional arguments (given as hash optional)*
  #   - +title+ -> Human-readable name of the Segment that is shown in the Recombee Admin UI.
  #
  #
    def initialize(segmentation_id, segment_id, filter, optional = {})
      @segmentation_id = segmentation_id
      @segment_id = segment_id
      @filter = filter
      optional = normalize_optional(optional)
      @title = optional['title']
      @optional = optional
      @timeout = 10000
      @ensure_https = false
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["title"].include? par
      end
    end
  
    # HTTP method
    def method
      :post
    end
  
    # Values of body parameters as a Hash
    def body_parameters
      p = Hash.new
      p['filter'] = @filter
      p['title'] = @optional['title'] if @optional.include? 'title'
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
      "/{databaseId}/segmentations/manual-reql/#{@segmentation_id}/segments/#{@segment_id}"
    end
  end
end

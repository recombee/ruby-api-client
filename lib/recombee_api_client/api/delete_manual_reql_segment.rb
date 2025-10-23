#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'

  ##
  # Delete a Segment from a Manual ReQL Segmentation.
  #
  class DeleteManualReqlSegment < ApiRequest
    attr_reader :segmentation_id, :segment_id
    attr_accessor :timeout, :ensure_https

    ##
    # * *Required arguments*
    #   - +segmentation_id+ -> ID of the Segmentation from which the Segment should be deleted
    #   - +segment_id+ -> ID of the Segment that should be deleted
    #
    def initialize(segmentation_id, segment_id)
      @segmentation_id = segmentation_id
      @segment_id = segment_id
      @timeout = 10_000
      @ensure_https = false
    end

    # HTTP method
    def method
      :delete
    end

    # Values of body parameters as a Hash
    def body_parameters
      {}
    end

    # Values of query parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      {}
    end

    # Relative path to the endpoint
    def path
      "/{databaseId}/segmentations/manual-reql/#{@segmentation_id}/segments/#{@segment_id}"
    end
  end
end

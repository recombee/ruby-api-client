#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Get existing Segmentation.
  #
  class GetSegmentation < ApiRequest
    attr_reader :segmentation_id
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +segmentation_id+ -> ID of the Segmentation that should be returned
  #
    def initialize(segmentation_id)
      @segmentation_id = segmentation_id
      @timeout = 10000
      @ensure_https = false
    end
  
    # HTTP method
    def method
      :get
    end
  
    # Values of body parameters as a Hash
    def body_parameters
      p = Hash.new
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
      "/{databaseId}/segmentations/list/#{@segmentation_id}"
    end
  end
end

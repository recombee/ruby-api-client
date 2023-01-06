#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Return all existing items Segmentations.
  #
  class ListSegmentations < ApiRequest
    attr_reader :source_type
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +source_type+ -> List Segmentations based on a particular type of data. Currently only `items` are supported.
  #
    def initialize(source_type)
      @source_type = source_type
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
      params['sourceType'] = @source_type
      params
    end
  
    # Relative path to the endpoint
    def path
      "/{databaseId}/segmentations/list/"
    end
  end
end

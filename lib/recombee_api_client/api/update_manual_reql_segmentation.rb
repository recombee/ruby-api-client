#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'

  ##
  # Update an existing Segmentation.
  #
  class UpdateManualReqlSegmentation < ApiRequest
    attr_reader :segmentation_id, :title, :description
    attr_accessor :timeout, :ensure_https

    ##
    # * *Required arguments*
    #   - +segmentation_id+ -> ID of the updated Segmentation
    #
    # * *Optional arguments (given as hash optional)*
    #   - +title+ -> Human-readable name that is shown in the Recombee Admin UI.
    #
    #   - +description+ -> Description that is shown in the Recombee Admin UI.
    #
    #
    def initialize(segmentation_id, optional = {})
      @segmentation_id = segmentation_id
      optional = normalize_hash_to_camel_case(optional)
      @title = optional['title']
      @description = optional['description']
      @optional = optional
      @timeout = 10_000
      @ensure_https = false
      @optional.each do |par, _|
        raise UnknownOptionalParameter.new(par) unless %w[title description].include? par
      end
    end

    # HTTP method
    def method
      :post
    end

    # Values of body parameters as a Hash
    def body_parameters
      p = {}
      p['title'] = @optional['title'] if @optional.include? 'title'
      p['description'] = @optional['description'] if @optional.include? 'description'

      p
    end

    # Values of query parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      {}
    end

    # Relative path to the endpoint
    def path
      "/{databaseId}/segmentations/manual-reql/#{@segmentation_id}"
    end
  end
end

#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'

  ##
  # Adds a detail view of the given item made by the given user.
  #
  class AddDetailView < ApiRequest
    attr_reader :user_id, :item_id, :timestamp, :duration, :cascade_create, :recomm_id, :additional_data,
                :auto_presented
    attr_accessor :timeout, :ensure_https

    ##
    # * *Required arguments*
    #   - +user_id+ -> User who viewed the item
    #   - +item_id+ -> Viewed item
    #
    # * *Optional arguments (given as hash optional)*
    #   - +timestamp+ -> UTC timestamp of the view as ISO8601-1 pattern or UTC epoch time. The default value is the current time.
    #   - +duration+ -> Duration of the view
    #   - +cascadeCreate+ -> Sets whether the given user/item should be created if not present in the database.
    #   - +recommId+ -> If this detail view is based on a recommendation request, `recommId` is the id of the clicked recommendation.
    #   - +additionalData+ -> A dictionary of additional data for the interaction.
    #   - +autoPresented+ -> Indicates whether the item was automatically presented to the user (e.g., in a swiping feed) or explicitly requested by the user (e.g., by clicking on a link). Defaults to `false`.
    #
    def initialize(user_id, item_id, optional = {})
      @user_id = user_id
      @item_id = item_id
      optional = normalize_hash_to_camel_case(optional)
      @timestamp = optional['timestamp']
      @duration = optional['duration']
      @cascade_create = optional['cascadeCreate']
      @recomm_id = optional['recommId']
      @additional_data = optional['additionalData']
      @auto_presented = optional['autoPresented']
      @optional = optional
      @timeout = 3000
      @ensure_https = false
      @optional.each do |par, _|
        raise UnknownOptionalParameter.new(par) unless %w[timestamp duration cascadeCreate recommId
                                                          additionalData autoPresented].include? par
      end
    end

    # HTTP method
    def method
      :post
    end

    # Values of body parameters as a Hash
    def body_parameters
      p = {}
      p['userId'] = @user_id
      p['itemId'] = @item_id
      p['timestamp'] = @optional['timestamp'] if @optional.include? 'timestamp'
      p['duration'] = @optional['duration'] if @optional.include? 'duration'
      p['cascadeCreate'] = @optional['cascadeCreate'] if @optional.include? 'cascadeCreate'
      p['recommId'] = @optional['recommId'] if @optional.include? 'recommId'
      p['additionalData'] = @optional['additionalData'] if @optional.include? 'additionalData'
      p['autoPresented'] = @optional['autoPresented'] if @optional.include? 'autoPresented'

      p
    end

    # Values of query parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      {}
    end

    # Relative path to the endpoint
    def path
      '/{databaseId}/detailviews/'
    end
  end
end

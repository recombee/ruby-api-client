#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'

  ##
  # Composite Recommendation returns both a *source entity* (e.g., an Item or [Item Segment](https://docs.recombee.com/segmentations)) and a list of related recommendations in a single response.
  #
  # It is ideal for use cases such as personalized homepage sections (*Articles from <category>*), *Because You Watched <movie>*, or *Artists Related to Your Favorite Artist <artist>*.
  #
  # See detailed **examples and configuration guidance** in the [Composite Scenarios documentation](https://docs.recombee.com/scenarios#composite-recommendations).
  #
  # **Structure**
  #
  # The endpoint operates in two stages:
  # 1. Recommends the *source* (e.g., an Item Segment or item) to the user.
  # 2. Recommends *results* (items or Item Segments) related to that *source*.
  #
  # For example, *Articles from <category>* can be decomposed into:
  #  - [Recommend Item Segments To User](https://docs.recombee.com/api#recommend-item-segments-to-user) to find the category.
  #  - [Recommend Items To Item Segment](https://docs.recombee.com/api#recommend-items-to-item-segment) to recommend articles from that category.
  #
  # Since the first step uses [Recommend Item Segments To User](https://docs.recombee.com/api#recommend-items-to-user), you must include the `userId` parameter in the *Composite Recommendation* request.
  #
  # Each *Composite Recommendation* counts as a single recommendation API request for billing.
  #
  # **Stage-specific Parameters**
  #
  # Additional parameters can be supplied via [sourceSettings](https://docs.recombee.com/api#composite-recommendation-param-sourceSettings) and [resultSettings](https://docs.recombee.com/api#composite-recommendation-param-resultSettings).
  # In the example above:
  #  - `sourceSettings` may include any parameter valid for [Recommend Item Segments To User](https://docs.recombee.com/api#recommend-items-to-user) (e.g., `filter`, `booster`).
  #  - `resultSettings` may include any parameter valid for [Recommend Items To Item Segment](https://docs.recombee.com/api#recommend-items-to-item-segment).
  #
  # See [this example](https://docs.recombee.com/api#composite-recommendation-example-setting-parameters-for-individual-stages) for more details.
  #
  class CompositeRecommendation < ApiRequest
    attr_reader :scenario, :count, :item_id, :user_id, :logic, :segment_id, :search_query, :cascade_create,
                :source_settings, :result_settings, :expert_settings
    attr_accessor :timeout, :ensure_https

    ##
    # * *Required arguments*
    #   - +scenario+ -> Scenario defines a particular application of recommendations. It can be, for example, "homepage", "cart", or "emailing".
    #
    # You can set various settings to the [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com). You can also see the performance of each scenario in the Admin UI separately, so you can check how well each application performs.
    #
    # The AI that optimizes models to get the best results may optimize different scenarios separately or even use different models in each of the scenarios.
    #
    #   - +count+ -> Number of items to be recommended (N for the top-N recommendation).
    #
    #
    # * *Optional arguments (given as hash optional)*
    #   - +itemId+ -> ID of the item for which the recommendations are to be generated.
    #
    #   - +userId+ -> ID of the user for which the recommendations are to be generated.
    #
    #   - +logic+ -> Logic specifies the particular behavior of the recommendation models. You can pick tailored logic for your domain and use case.
    # See [this section](https://docs.recombee.com/recommendation_logics) for a list of available logics and other details.
    #
    # The difference between `logic` and `scenario` is that `logic` specifies mainly behavior, while `scenario` specifies the place where recommendations are shown to the users.
    #
    # Logic can also be set to a [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com).
    #
    #   - +segmentId+ -> ID of the segment from `contextSegmentationId` for which the recommendations are to be generated.
    #
    #   - +searchQuery+ -> Search query provided by the user. It is used for the full-text search. Only applicable if the *scenario* corresponds to a search scenario.
    #
    #   - +cascadeCreate+ -> If the entity for the source recommendation does not exist in the database, returns a list of non-personalized recommendations and creates the user in the database. This allows, for example, rotations in the following recommendations for that entity, as the entity will be already known to the system.
    #
    #   - +sourceSettings+ -> Parameters applied for recommending the *Source* stage. The accepted parameters correspond with the recommendation sub-endpoint used to recommend the *Source*.
    #
    #   - +resultSettings+ -> Parameters applied for recommending the *Result* stage. The accepted parameters correspond with the recommendation sub-endpoint used to recommend the *Result*.
    #
    #   - +expertSettings+ -> Dictionary of custom options.
    #
    #
    def initialize(scenario, count, optional = {})
      @scenario = scenario
      @count = count
      optional = normalize_hash_to_camel_case(optional)
      @item_id = optional['itemId']
      @user_id = optional['userId']
      @logic = optional['logic']
      @segment_id = optional['segmentId']
      @search_query = optional['searchQuery']
      @cascade_create = optional['cascadeCreate']
      @source_settings = optional['sourceSettings']
      @result_settings = optional['resultSettings']
      @expert_settings = optional['expertSettings']
      @optional = optional
      @timeout = 3000
      @ensure_https = false
      @optional.each do |par, _|
        raise UnknownOptionalParameter.new(par) unless %w[itemId userId logic segmentId searchQuery
                                                          cascadeCreate sourceSettings resultSettings expertSettings].include? par
      end
    end

    # HTTP method
    def method
      :post
    end

    # Values of body parameters as a Hash
    def body_parameters
      p = {}
      p['scenario'] = @scenario
      p['count'] = @count
      p['itemId'] = @optional['itemId'] if @optional.include? 'itemId'
      p['userId'] = @optional['userId'] if @optional.include? 'userId'
      p['logic'] = @optional['logic'] if @optional.include? 'logic'
      p['segmentId'] = @optional['segmentId'] if @optional.include? 'segmentId'
      p['searchQuery'] = @optional['searchQuery'] if @optional.include? 'searchQuery'
      p['cascadeCreate'] = @optional['cascadeCreate'] if @optional.include? 'cascadeCreate'
      p['sourceSettings'] = @optional['sourceSettings'] if @optional.include? 'sourceSettings'
      p['resultSettings'] = @optional['resultSettings'] if @optional.include? 'resultSettings'
      p['expertSettings'] = @optional['expertSettings'] if @optional.include? 'expertSettings'

      p
    end

    # Values of query parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      {}
    end

    # Relative path to the endpoint
    def path
      '/{databaseId}/recomms/composite/'
    end
  end
end

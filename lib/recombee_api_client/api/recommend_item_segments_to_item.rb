#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'

  ##
  # Recommends Segments from a [Segmentation](https://docs.recombee.com/segmentations) that are the most relevant to a particular item.
  #
  # Based on the used Segmentation, this endpoint can be used for example for:
  #
  #  - Recommending the related categories
  #  - Recommending the related genres
  #  - Recommending the related brands
  #  - Recommending the related artists
  #
  # You need to set the used Segmentation the Admin UI in the [Scenario settings](https://docs.recombee.com/scenarios) prior to using this endpoint.
  #
  # The returned segments are sorted by relevance (first segment being the most relevant).
  #
  # It is also possible to use POST HTTP method (for example in case of very long ReQL filter) - query parameters then become body parameters.
  #
  class RecommendItemSegmentsToItem < ApiRequest
    attr_reader :item_id, :target_user_id, :count, :scenario, :cascade_create, :filter, :booster, :logic,
                :expert_settings, :return_ab_group, :reql_expressions
    attr_accessor :timeout, :ensure_https

    ##
    # * *Required arguments*
    #   - +item_id+ -> ID of the item for which the recommendations are to be generated.
    #   - +target_user_id+ -> ID of the user who will see the recommendations.
    #
    # Specifying the *targetUserId* is beneficial because:
    #
    # * It makes the recommendations personalized
    # * Allows the calculation of Actions and Conversions
    #  in the graphical user interface,
    #  as Recombee can pair the user who got recommendations
    #  and who afterward viewed/purchased an item.
    #
    # If you insist on not specifying the user, pass `null`
    # (`None`, `nil`, `NULL` etc., depending on the language) to *targetUserId*.
    # Do not create some special dummy user for getting recommendations,
    # as it could mislead the recommendation models,
    # and result in wrong recommendations.
    #
    # For anonymous/unregistered users, it is possible to use, for example, their session ID.
    #
    #   - +count+ -> Number of item segments to be recommended (N for the top-N recommendation).
    #
    #
    # * *Optional arguments (given as hash optional)*
    #   - +scenario+ -> Scenario defines a particular application of recommendations. It can be, for example, "homepage", "cart", or "emailing".
    #
    # You can set various settings to the [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com). You can also see the performance of each scenario in the Admin UI separately, so you can check how well each application performs.
    #
    # The AI that optimizes models to get the best results may optimize different scenarios separately or even use different models in each of the scenarios.
    #
    #   - +cascadeCreate+ -> If the user does not exist in the database, returns a list of non-personalized recommendations and creates the user in the database. This allows, for example, rotations in the following recommendations for that user, as the user will be already known to the system.
    #
    #   - +filter+ -> Boolean-returning [ReQL](https://docs.recombee.com/reql) expression which allows you to filter recommended segments based on the `segmentationId`.
    #
    #   - +booster+ -> Number-returning [ReQL](https://docs.recombee.com/reql) expression which allows you to boost recommendation rate of some segments based on the `segmentationId`.
    #
    #   - +logic+ -> Logic specifies the particular behavior of the recommendation models. You can pick tailored logic for your domain and use case.
    # See [this section](https://docs.recombee.com/recommendation_logics) for a list of available logics and other details.
    #
    # The difference between `logic` and `scenario` is that `logic` specifies mainly behavior, while `scenario` specifies the place where recommendations are shown to the users.
    #
    # Logic can also be set to a [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com).
    #
    #   - +expertSettings+ -> Dictionary of custom options.
    #
    #   - +returnAbGroup+ -> If there is a custom AB-testing running, return the name of the group to which the request belongs.
    #
    #   - +reqlExpressions+ -> A dictionary of [ReQL](https://docs.recombee.com/reql) expressions that will be executed for each recommended Item Segment.
    # This can be used to compute additional properties of the recommended Item Segments.
    #
    # The keys are the names of the expressions, and the values are the actual ReQL expressions.
    #
    # Example request:
    # ```json
    # {
    #  "reqlExpressions": {
    #    "countItems": "size(segment_items(\"categories\", 'segmentId'))"
    #  }
    # }
    # ```
    #
    # Example response:
    # ```json
    # {
    #  "recommId": "a7ac55a4-8d6e-4f19-addc-abac4164d8a8",
    #  "recomms":
    #    [
    #      {
    #        "id": "category-fantasy-books",
    #        "reqlEvaluations": {
    #          "countItems": 486
    #        }
    #      },
    #      {
    #        "id": "category-sci-fi-costumes",
    #        "reqlEvaluations": {
    #          "countItems": 19
    #        }
    #      }
    #    ],
    #   "numberNextRecommsCalls": 0
    # }
    # ```
    #
    #
    def initialize(item_id, target_user_id, count, optional = {})
      @item_id = item_id
      @target_user_id = target_user_id
      @count = count
      optional = normalize_hash_to_camel_case(optional)
      @scenario = optional['scenario']
      @cascade_create = optional['cascadeCreate']
      @filter = optional['filter']
      @booster = optional['booster']
      @logic = optional['logic']
      @expert_settings = optional['expertSettings']
      @return_ab_group = optional['returnAbGroup']
      @reql_expressions = optional['reqlExpressions']
      @optional = optional
      @timeout = 3000
      @ensure_https = false
      @optional.each do |par, _|
        raise UnknownOptionalParameter.new(par) unless %w[scenario cascadeCreate filter booster logic
                                                          expertSettings returnAbGroup reqlExpressions].include? par
      end
    end

    # HTTP method
    def method
      :post
    end

    # Values of body parameters as a Hash
    def body_parameters
      p = {}
      p['targetUserId'] = @target_user_id
      p['count'] = @count
      p['scenario'] = @optional['scenario'] if @optional.include? 'scenario'
      p['cascadeCreate'] = @optional['cascadeCreate'] if @optional.include? 'cascadeCreate'
      p['filter'] = @optional['filter'] if @optional.include? 'filter'
      p['booster'] = @optional['booster'] if @optional.include? 'booster'
      p['logic'] = @optional['logic'] if @optional.include? 'logic'
      p['expertSettings'] = @optional['expertSettings'] if @optional.include? 'expertSettings'
      p['returnAbGroup'] = @optional['returnAbGroup'] if @optional.include? 'returnAbGroup'
      p['reqlExpressions'] = @optional['reqlExpressions'] if @optional.include? 'reqlExpressions'

      p
    end

    # Values of query parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      {}
    end

    # Relative path to the endpoint
    def path
      "/{databaseId}/recomms/items/#{@item_id}/item-segments/"
    end
  end
end

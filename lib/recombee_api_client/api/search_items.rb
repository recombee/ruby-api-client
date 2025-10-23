#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'

  ##
  # Full-text personalized search. The results are based on the provided `searchQuery` and also on the user's past interactions (purchases, ratings, etc.) with the items (items more suitable for the user are preferred in the results).
  #
  # All the string and set item properties are indexed by the search engine.
  #
  # This endpoint should be used in a search box on your website/app. It can be called multiple times as the user is typing the query in order to get the most viable suggestions based on the current state of the query, or once after submitting the whole query.
  #
  # The returned items are sorted by relevance (the first item being the most relevant).
  #
  # Besides the recommended items, also a unique `recommId` is returned in the response. It can be used to:
  #
  # - Let Recombee know that this search was successful (e.g., user clicked one of the recommended items). See [Reported metrics](https://docs.recombee.com/admin_ui#reported-metrics).
  # - Get subsequent search results when the user scrolls down or goes to the next page. See [Recommend Next Items](https://docs.recombee.com/api#recommend-next-items).
  #
  # It is also possible to use POST HTTP method (for example in the case of a very long ReQL filter) - query parameters then become body parameters.
  #
  class SearchItems < ApiRequest
    attr_reader :user_id, :search_query, :count, :scenario, :cascade_create, :return_properties, :included_properties,
                :filter, :booster, :logic, :reql_expressions, :expert_settings, :return_ab_group
    attr_accessor :timeout, :ensure_https

    ##
    # * *Required arguments*
    #   - +user_id+ -> ID of the user for whom personalized search will be performed.
    #   - +search_query+ -> Search query provided by the user. It is used for the full-text search.
    #   - +count+ -> Number of items to be returned (N for the top-N results).
    #
    # * *Optional arguments (given as hash optional)*
    #   - +scenario+ -> Scenario defines a particular search field in your user interface.
    #
    # You can set various settings to the [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com). You can also see the performance of each scenario in the Admin UI separately, so you can check how well each field performs.
    #
    # The AI that optimizes models to get the best results may optimize different scenarios separately, or even use different models in each of the scenarios.
    #
    #   - +cascadeCreate+ -> If the user does not exist in the database, returns a list of non-personalized search results and creates the user in the database. This allows, for example, rotations in the following recommendations for that user, as the user will be already known to the system.
    #   - +returnProperties+ -> With `returnProperties=true`, property values of the recommended items are returned along with their IDs in a JSON dictionary. The acquired property values can be used to easily display the recommended items to the user.
    #
    # Example response:
    # ```json
    #  {
    #    "recommId": "ce52ada4-e4d9-4885-943c-407db2dee837",
    #    "recomms":
    #      [
    #        {
    #          "id": "tv-178",
    #          "values": {
    #            "description": "4K TV with 3D feature",
    #            "categories":   ["Electronics", "Televisions"],
    #            "price": 342,
    #            "url": "myshop.com/tv-178"
    #          }
    #        },
    #        {
    #          "id": "mixer-42",
    #          "values": {
    #            "description": "Stainless Steel Mixer",
    #            "categories":   ["Home & Kitchen"],
    #            "price": 39,
    #            "url": "myshop.com/mixer-42"
    #          }
    #        }
    #      ],
    #    "numberNextRecommsCalls": 0
    #  }
    # ```
    #
    #   - +includedProperties+ -> Allows specifying which properties should be returned when `returnProperties=true` is set. The properties are given as a comma-separated list.
    #
    # Example response for `includedProperties=description,price`:
    # ```json
    #  {
    #    "recommId": "a86ee8d5-cd8e-46d1-886c-8b3771d0520b",
    #    "recomms":
    #      [
    #        {
    #          "id": "tv-178",
    #          "values": {
    #            "description": "4K TV with 3D feature",
    #            "price": 342
    #          }
    #        },
    #        {
    #          "id": "mixer-42",
    #          "values": {
    #            "description": "Stainless Steel Mixer",
    #            "price": 39
    #          }
    #        }
    #      ],
    #    "numberNextRecommsCalls": 0
    #  }
    # ```
    #
    #   - +filter+ -> Boolean-returning [ReQL](https://docs.recombee.com/reql) expression, which allows you to filter recommended items based on the values of their attributes.
    #
    # Filters can also be assigned to a [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com).
    #
    #   - +booster+ -> Number-returning [ReQL](https://docs.recombee.com/reql) expression, which allows you to boost the recommendation rate of some items based on the values of their attributes.
    #
    # Boosters can also be assigned to a [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com).
    #
    #   - +logic+ -> Logic specifies the particular behavior of the recommendation models. You can pick tailored logic for your domain and use case.
    # See [this section](https://docs.recombee.com/recommendation_logics) for a list of available logics and other details.
    #
    # The difference between `logic` and `scenario` is that `logic` specifies mainly behavior, while `scenario` specifies the place where recommendations are shown to the users.
    #
    # Logic can also be set to a [scenario](https://docs.recombee.com/scenarios) in the [Admin UI](https://admin.recombee.com).
    #
    #   - +reqlExpressions+ -> A dictionary of [ReQL](https://docs.recombee.com/reql) expressions that will be executed for each recommended item.
    # This can be used to compute additional properties of the recommended items that are not stored in the database.
    #
    # The keys are the names of the expressions, and the values are the actual ReQL expressions.
    #
    # Example request:
    # ```json
    # {
    #  "reqlExpressions": {
    #    "isInUsersCity": "context_user[\"city\"] in 'cities'",
    #    "distanceToUser": "earth_distance('location', context_user[\"location\"])"
    #  }
    # }
    # ```
    #
    # Example response:
    # ```json
    # {
    #  "recommId": "ce52ada4-e4d9-4885-943c-407db2dee837",
    #  "recomms":
    #    [
    #      {
    #        "id": "restaurant-178",
    #        "reqlEvaluations": {
    #          "isInUsersCity": true,
    #          "distanceToUser": 5200.2
    #        }
    #      },
    #      {
    #        "id": "bar-42",
    #        "reqlEvaluations": {
    #          "isInUsersCity": false,
    #          "distanceToUser": 2516.0
    #        }
    #      }
    #    ],
    #   "numberNextRecommsCalls": 0
    # }
    # ```
    #
    #   - +expertSettings+ -> Dictionary of custom options.
    #
    #   - +returnAbGroup+ -> If there is a custom AB-testing running, return the name of the group to which the request belongs.
    #
    #
    def initialize(user_id, search_query, count, optional = {})
      @user_id = user_id
      @search_query = search_query
      @count = count
      optional = normalize_hash_to_camel_case(optional)
      @scenario = optional['scenario']
      @cascade_create = optional['cascadeCreate']
      @return_properties = optional['returnProperties']
      @included_properties = optional['includedProperties']
      @filter = optional['filter']
      @booster = optional['booster']
      @logic = optional['logic']
      @reql_expressions = optional['reqlExpressions']
      @expert_settings = optional['expertSettings']
      @return_ab_group = optional['returnAbGroup']
      @optional = optional
      @timeout = 3000
      @ensure_https = false
      @optional.each do |par, _|
        raise UnknownOptionalParameter.new(par) unless %w[scenario cascadeCreate returnProperties
                                                          includedProperties filter booster logic reqlExpressions expertSettings returnAbGroup].include? par
      end
    end

    # HTTP method
    def method
      :post
    end

    # Values of body parameters as a Hash
    def body_parameters
      p = {}
      p['searchQuery'] = @search_query
      p['count'] = @count
      p['scenario'] = @optional['scenario'] if @optional.include? 'scenario'
      p['cascadeCreate'] = @optional['cascadeCreate'] if @optional.include? 'cascadeCreate'
      p['returnProperties'] = @optional['returnProperties'] if @optional.include? 'returnProperties'
      p['includedProperties'] = @optional['includedProperties'] if @optional.include? 'includedProperties'
      p['filter'] = @optional['filter'] if @optional.include? 'filter'
      p['booster'] = @optional['booster'] if @optional.include? 'booster'
      p['logic'] = @optional['logic'] if @optional.include? 'logic'
      p['reqlExpressions'] = @optional['reqlExpressions'] if @optional.include? 'reqlExpressions'
      p['expertSettings'] = @optional['expertSettings'] if @optional.include? 'expertSettings'
      p['returnAbGroup'] = @optional['returnAbGroup'] if @optional.include? 'returnAbGroup'

      p
    end

    # Values of query parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      {}
    end

    # Relative path to the endpoint
    def path
      "/{databaseId}/search/users/#{@user_id}/items/"
    end
  end
end

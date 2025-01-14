#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Recommends Items that are the most relevant to a particular Segment from a context [Segmentation](https://docs.recombee.com/segmentations.html).
  #
  #Based on the used Segmentation, this endpoint can be used for example for:
  #
  #- Recommending articles related to a particular topic
  #- Recommending songs belonging to a particular genre
  #- Recommending products produced by a particular brand
  #
  #You need to set the used context Segmentation in the Admin UI in the [Scenario settings](https://docs.recombee.com/scenarios) prior to using this endpoint.
  #
  #The returned items are sorted by relevance (the first item being the most relevant).
  #
  #It is also possible to use the POST HTTP method (for example, in the case of a very long ReQL filter) — query parameters then become body parameters.
  #
  class RecommendItemsToItemSegment < ApiRequest
    attr_reader :context_segment_id, :target_user_id, :count, :scenario, :cascade_create, :return_properties, :included_properties, :filter, :booster, :logic, :min_relevance, :rotation_rate, :rotation_time, :expert_settings, :return_ab_group
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +context_segment_id+ -> ID of the segment from `contextSegmentationId` for which the recommendations are to be generated.
  #   - +target_user_id+ -> ID of the user who will see the recommendations.
  #
  #Specifying the *targetUserId* is beneficial because:
  #
  #* It makes the recommendations personalized
  #* Allows the calculation of Actions and Conversions
  #  in the graphical user interface,
  #  as Recombee can pair the user who got recommendations
  #  and who afterward viewed/purchased an item.
  #
  #If you insist on not specifying the user, pass `null`
  #(`None`, `nil`, `NULL` etc., depending on the language) to *targetUserId*.
  #Do not create some special dummy user for getting recommendations,
  #as it could mislead the recommendation models,
  #and result in wrong recommendations.
  #
  #For anonymous/unregistered users, it is possible to use, for example, their session ID.
  #
  #   - +count+ -> Number of items to be recommended (N for the top-N recommendation).
  #
  # * *Optional arguments (given as hash optional)*
  #   - +scenario+ -> Scenario defines a particular application of recommendations. It can be, for example, "homepage", "cart", or "emailing".
  #
  #You can set various settings to the [scenario](https://docs.recombee.com/scenarios.html) in the [Admin UI](https://admin.recombee.com). You can also see the performance of each scenario in the Admin UI separately, so you can check how well each application performs.
  #
  #The AI that optimizes models to get the best results may optimize different scenarios separately or even use different models in each of the scenarios.
  #
  #   - +cascadeCreate+ -> If an item of the given *itemId* or user of the given *targetUserId* doesn't exist in the database, it creates the missing entity/entities and returns some (non-personalized) recommendations. This allows, for example, rotations in the following recommendations for the user of the given *targetUserId*, as the user will be already known to the system.
  #   - +returnProperties+ -> With `returnProperties=true`, property values of the recommended items are returned along with their IDs in a JSON dictionary. The acquired property values can be used to easily display the recommended items to the user. 
  #
  #Example response:
  #```
  #  {
  #    "recommId": "0c6189e7-dc1a-429a-b613-192696309361",
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
  #```
  #
  #   - +includedProperties+ -> Allows specifying which properties should be returned when `returnProperties=true` is set. The properties are given as a comma-separated list.
  #
  #Example response for `includedProperties=description,price`:
  #```
  #  {
  #    "recommId": "6842c725-a79f-4537-a02c-f34d668a3f80",
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
  #```
  #
  #   - +filter+ -> Boolean-returning [ReQL](https://docs.recombee.com/reql.html) expression, which allows you to filter recommended items based on the values of their attributes.
  #
  #Filters can also be assigned to a [scenario](https://docs.recombee.com/scenarios.html) in the [Admin UI](https://admin.recombee.com).
  #
  #   - +booster+ -> Number-returning [ReQL](https://docs.recombee.com/reql.html) expression, which allows you to boost the recommendation rate of some items based on the values of their attributes.
  #
  #Boosters can also be assigned to a [scenario](https://docs.recombee.com/scenarios.html) in the [Admin UI](https://admin.recombee.com).
  #
  #   - +logic+ -> Logic specifies the particular behavior of the recommendation models. You can pick tailored logic for your domain and use case.
  #See [this section](https://docs.recombee.com/recommendation_logics.html) for a list of available logics and other details.
  #
  #The difference between `logic` and `scenario` is that `logic` specifies mainly behavior, while `scenario` specifies the place where recommendations are shown to the users.
  #
  #Logic can also be set to a [scenario](https://docs.recombee.com/scenarios.html) in the [Admin UI](https://admin.recombee.com).
  #
  #   - +minRelevance+ -> **Expert option** If the *targetUserId* is provided:  Specifies the threshold of how relevant must the recommended items be to the user. Possible values one of: "low", "medium", "high". The default value is "low", meaning that the system attempts to recommend a number of items equal to *count* at any cost. If there is not enough data (such as interactions or item properties), this may even lead to bestseller-based recommendations being appended to reach the full *count*. This behavior may be suppressed by using "medium" or "high" values. In such case, the system only recommends items of at least the requested relevance and may return less than *count* items when there is not enough data to fulfill it.
  #
  #   - +rotationRate+ -> **Expert option** If the *targetUserId* is provided: If your users browse the system in real-time, it may easily happen that you wish to offer them recommendations multiple times. Here comes the question: how much should the recommendations change? Should they remain the same, or should they rotate? Recombee API allows you to control this per request in a backward fashion. You may penalize an item for being recommended in the near past. For the specific user, `rotationRate=1` means maximal rotation, `rotationRate=0` means absolutely no rotation. You may also use, for example, `rotationRate=0.2` for only slight rotation of recommended items.
  #
  #   - +rotationTime+ -> **Expert option** If the *targetUserId* is provided: Taking *rotationRate* into account, specifies how long it takes for an item to recover from the penalization. For example, `rotationTime=7200.0` means that items recommended less than 2 hours ago are penalized.
  #
  #   - +expertSettings+ -> Dictionary of custom options.
  #
  #   - +returnAbGroup+ -> If there is a custom AB-testing running, return the name of the group to which the request belongs.
  #
  #
    def initialize(context_segment_id, target_user_id, count, optional = {})
      @context_segment_id = context_segment_id
      @target_user_id = target_user_id
      @count = count
      optional = normalize_optional(optional)
      @scenario = optional['scenario']
      @cascade_create = optional['cascadeCreate']
      @return_properties = optional['returnProperties']
      @included_properties = optional['includedProperties']
      @filter = optional['filter']
      @booster = optional['booster']
      @logic = optional['logic']
      @min_relevance = optional['minRelevance']
      @rotation_rate = optional['rotationRate']
      @rotation_time = optional['rotationTime']
      @expert_settings = optional['expertSettings']
      @return_ab_group = optional['returnAbGroup']
      @optional = optional
      @timeout = 3000
      @ensure_https = false
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["scenario","cascadeCreate","returnProperties","includedProperties","filter","booster","logic","minRelevance","rotationRate","rotationTime","expertSettings","returnAbGroup"].include? par
      end
    end
  
    # HTTP method
    def method
      :post
    end
  
    # Values of body parameters as a Hash
    def body_parameters
      p = Hash.new
      p['contextSegmentId'] = @context_segment_id
      p['targetUserId'] = @target_user_id
      p['count'] = @count
      p['scenario'] = @optional['scenario'] if @optional.include? 'scenario'
      p['cascadeCreate'] = @optional['cascadeCreate'] if @optional.include? 'cascadeCreate'
      p['returnProperties'] = @optional['returnProperties'] if @optional.include? 'returnProperties'
      p['includedProperties'] = @optional['includedProperties'] if @optional.include? 'includedProperties'
      p['filter'] = @optional['filter'] if @optional.include? 'filter'
      p['booster'] = @optional['booster'] if @optional.include? 'booster'
      p['logic'] = @optional['logic'] if @optional.include? 'logic'
      p['minRelevance'] = @optional['minRelevance'] if @optional.include? 'minRelevance'
      p['rotationRate'] = @optional['rotationRate'] if @optional.include? 'rotationRate'
      p['rotationTime'] = @optional['rotationTime'] if @optional.include? 'rotationTime'
      p['expertSettings'] = @optional['expertSettings'] if @optional.include? 'expertSettings'
      p['returnAbGroup'] = @optional['returnAbGroup'] if @optional.include? 'returnAbGroup'
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
      "/{databaseId}/recomms/item-segments/items/"
    end
  end
end

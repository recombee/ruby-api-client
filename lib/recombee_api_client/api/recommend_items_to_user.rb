#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Based on user's past interactions (purchases, ratings, etc.) with the items, recommends top-N items that are most likely to be of high value for a given user.
  #
  #It is also possible to use POST HTTP method (for example in case of very long ReQL filter) - query parameters then become body parameters.
  #
  #The returned items are sorted by relevancy (first item being the most relevant).
  #
  class RecommendItemsToUser < ApiRequest
    attr_reader :user_id, :count, :filter, :booster, :cascade_create, :scenario, :return_properties, :included_properties, :diversity, :min_relevance, :rotation_rate, :rotation_time, :expert_settings, :return_ab_group
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +user_id+ -> ID of the user for which personalized recommendations are to be generated.
  #   - +count+ -> Number of items to be recommended (N for the top-N recommendation).
  #
  # * *Optional arguments (given as hash optional)*
  #   - +filter+ -> Boolean-returning [ReQL](https://docs.recombee.com/reql.html) expression which allows you to filter recommended items based on the values of their attributes.
  #   - +booster+ -> Number-returning [ReQL](https://docs.recombee.com/reql.html) expression which allows you to boost recommendation rate of some items based on the values of their attributes.
  #   - +cascadeCreate+ -> If the user does not exist in the database, returns a list of non-personalized recommendations and creates the user in the database. This allows for example rotations in the following recommendations for that user, as the user will be already known to the system.
  #   - +scenario+ -> Scenario defines a particular application of recommendations. It can be for example "homepage", "cart" or "emailing". You can see each scenario in the UI separately, so you can check how well each application performs. The AI which optimizes models in order to get the best results may optimize different scenarios separately, or even use different models in each of the scenarios.
  #   - +returnProperties+ -> With `returnProperties=true`, property values of the recommended items are returned along with their IDs in a JSON dictionary. The acquired property values can be used for easy displaying of the recommended items to the user. 
  #
  #Example response:
  #```
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
  #      ]
  #  }
  #```
  #
  #   - +includedProperties+ -> Allows to specify, which properties should be returned when `returnProperties=true` is set. The properties are given as a comma-separated list. 
  #
  #Example response for `includedProperties=description,price`:
  #```
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
  #      ]
  #  }
  #```
  #
  #   - +diversity+ -> **Expert option** Real number from [0.0, 1.0] which determines how much mutually dissimilar should the recommended items be. The default value is 0.0, i.e., no diversification. Value 1.0 means maximal diversification.
  #
  #   - +minRelevance+ -> **Expert option** Specifies the threshold of how much relevant must the recommended items be to the user. Possible values one of: "low", "medium", "high". The default value is "low", meaning that the system attempts to recommend number of items equal to *count* at any cost. If there are not enough data (such as interactions or item properties), this may even lead to bestseller-based recommendations to be appended to reach the full *count*. This behavior may be suppressed by using "medium" or "high" values. In such case, the system only recommends items of at least the requested relevancy, and may return less than *count* items when there is not enough data to fulfill it.
  #
  #   - +rotationRate+ -> **Expert option** If your users browse the system in real-time, it may easily happen that you wish to offer them recommendations multiple times. Here comes the question: how much should the recommendations change? Should they remain the same, or should they rotate? Recombee API allows you to control this per-request in backward fashion. You may penalize an item for being recommended in the near past. For the specific user, `rotationRate=1` means maximal rotation, `rotationRate=0` means absolutely no rotation. You may also use, for example `rotationRate=0.2` for only slight rotation of recommended items. Default: `0.1`.
  #
  #   - +rotationTime+ -> **Expert option** Taking *rotationRate* into account, specifies how long time it takes to an item to recover from the penalization. For example, `rotationTime=7200.0` means that items recommended less than 2 hours ago are penalized. Default: `7200.0`.
  #
  #   - +expertSettings+ -> Dictionary of custom options.
  #
  #   - +returnAbGroup+ -> If there is a custom AB-testing running, return name of group to which the request belongs.
  #
  #
    def initialize(user_id, count, optional = {})
      @user_id = user_id
      @count = count
      optional = normalize_optional(optional)
      @filter = optional['filter']
      @booster = optional['booster']
      @cascade_create = optional['cascadeCreate']
      @scenario = optional['scenario']
      @return_properties = optional['returnProperties']
      @included_properties = optional['includedProperties']
      @diversity = optional['diversity']
      @min_relevance = optional['minRelevance']
      @rotation_rate = optional['rotationRate']
      @rotation_time = optional['rotationTime']
      @expert_settings = optional['expertSettings']
      @return_ab_group = optional['returnAbGroup']
      @optional = optional
      @timeout = 3000
      @ensure_https = false
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["filter","booster","cascadeCreate","scenario","returnProperties","includedProperties","diversity","minRelevance","rotationRate","rotationTime","expertSettings","returnAbGroup"].include? par
      end
    end
  
    # HTTP method
    def method
      :post
    end
  
    # Values of body parameters as a Hash
    def body_parameters
      p = Hash.new
      p['count'] = @count
      p['filter'] = @optional['filter'] if @optional.include? 'filter'
      p['booster'] = @optional['booster'] if @optional.include? 'booster'
      p['cascadeCreate'] = @optional['cascadeCreate'] if @optional.include? 'cascadeCreate'
      p['scenario'] = @optional['scenario'] if @optional.include? 'scenario'
      p['returnProperties'] = @optional['returnProperties'] if @optional.include? 'returnProperties'
      p['includedProperties'] = @optional['includedProperties'] if @optional.include? 'includedProperties'
      p['diversity'] = @optional['diversity'] if @optional.include? 'diversity'
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
      "/{databaseId}/recomms/users/#{@user_id}/items/"
    end
  end
end

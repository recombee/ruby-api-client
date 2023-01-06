#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Gets users similar to the given user, based on the user's past interactions (purchases, ratings, etc.) and values of properties.
  #
  #It is also possible to use POST HTTP method (for example in the case of a very long ReQL filter) - query parameters then become body parameters.
  #
  #The returned users are sorted by similarity (the first user being the most similar).
  #
  class RecommendUsersToUser < ApiRequest
    attr_reader :user_id, :count, :scenario, :cascade_create, :return_properties, :included_properties, :filter, :booster, :logic, :diversity, :min_relevance, :rotation_rate, :rotation_time, :expert_settings, :return_ab_group
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +user_id+ -> User to whom we find similar users
  #   - +count+ -> Number of users to be recommended (N for the top-N recommendation).
  #
  # * *Optional arguments (given as hash optional)*
  #   - +scenario+ -> Scenario defines a particular application of recommendations. It can be, for example, "homepage", "cart", or "emailing".
  #
  #You can set various settings to the [scenario](https://docs.recombee.com/scenarios.html) in the [Admin UI](https://admin.recombee.com). You can also see the performance of each scenario in the Admin UI separately, so you can check how well each application performs.
  #
  #The AI that optimizes models to get the best results may optimize different scenarios separately or even use different models in each of the scenarios.
  #
  #   - +cascadeCreate+ -> If the user does not exist in the database, returns a list of non-personalized recommendations and creates the user in the database. This allows, for example, rotations in the following recommendations for that user, as the user will be already known to the system.
  #   - +returnProperties+ -> With `returnProperties=true`, property values of the recommended users are returned along with their IDs in a JSON dictionary. The acquired property values can be used to easily display the recommended users. 
  #
  #Example response:
  #```
  #  {
  #    "recommId": "9cb9c55d-50ba-4478-84fd-ab456136156e",
  #    "recomms": 
  #      [
  #        {
  #          "id": "user-17",
  #          "values": {
  #            "country": "US",
  #            "sex": "F"
  #          }
  #        },
  #        {
  #          "id": "user-2",
  #          "values": {
  #            "country": "CAN",
  #            "sex": "M"
  #          }
  #        }
  #      ],
  #    "numberNextRecommsCalls": 0
  #  }
  #```
  #
  #   - +includedProperties+ -> Allows specifying which properties should be returned when `returnProperties=true` is set. The properties are given as a comma-separated list.
  #
  #Example response for `includedProperties=country`:
  #```
  #  {
  #    "recommId": "b326d82d-5d57-4b45-b362-c9d6f0895855",
  #    "recomms":
  #      [
  #        {
  #          "id": "user-17",
  #          "values": {
  #            "country": "US"
  #          }
  #        },
  #        {
  #          "id": "user-2",
  #          "values": {
  #            "country": "CAN"
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
  #   - +diversity+ -> **Expert option** Real number from [0.0, 1.0], which determines how mutually dissimilar the recommended users should be. The default value is 0.0, i.e., no diversification. Value 1.0 means maximal diversification.
  #
  #   - +minRelevance+ -> **Expert option** Specifies the threshold of how relevant must the recommended users be. Possible values one of: "low", "medium", "high".
  #
  #   - +rotationRate+ -> **Expert option** If your users browse the system in real-time, it may easily happen that you wish to offer them recommendations multiple times. Here comes the question: how much should the recommendations change? Should they remain the same, or should they rotate? Recombee API allows you to control this per request in a backward fashion. You may penalize a user for being recommended in the near past. For the specific user, `rotationRate=1` means maximal rotation, `rotationRate=0` means absolutely no rotation. You may also use, for example, `rotationRate=0.2` for only slight rotation of recommended users.
  #
  #   - +rotationTime+ -> **Expert option** Taking *rotationRate* into account, specifies how long it takes for a user to recover from the penalization. For example, `rotationTime=7200.0` means that users recommended less than 2 hours ago are penalized.
  #
  #   - +expertSettings+ -> Dictionary of custom options.
  #
  #   - +returnAbGroup+ -> If there is a custom AB-testing running, return the name of the group to which the request belongs.
  #
  #
    def initialize(user_id, count, optional = {})
      @user_id = user_id
      @count = count
      optional = normalize_optional(optional)
      @scenario = optional['scenario']
      @cascade_create = optional['cascadeCreate']
      @return_properties = optional['returnProperties']
      @included_properties = optional['includedProperties']
      @filter = optional['filter']
      @booster = optional['booster']
      @logic = optional['logic']
      @diversity = optional['diversity']
      @min_relevance = optional['minRelevance']
      @rotation_rate = optional['rotationRate']
      @rotation_time = optional['rotationTime']
      @expert_settings = optional['expertSettings']
      @return_ab_group = optional['returnAbGroup']
      @optional = optional
      @timeout = 50000
      @ensure_https = false
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["scenario","cascadeCreate","returnProperties","includedProperties","filter","booster","logic","diversity","minRelevance","rotationRate","rotationTime","expertSettings","returnAbGroup"].include? par
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
      p['scenario'] = @optional['scenario'] if @optional.include? 'scenario'
      p['cascadeCreate'] = @optional['cascadeCreate'] if @optional.include? 'cascadeCreate'
      p['returnProperties'] = @optional['returnProperties'] if @optional.include? 'returnProperties'
      p['includedProperties'] = @optional['includedProperties'] if @optional.include? 'includedProperties'
      p['filter'] = @optional['filter'] if @optional.include? 'filter'
      p['booster'] = @optional['booster'] if @optional.include? 'booster'
      p['logic'] = @optional['logic'] if @optional.include? 'logic'
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
      "/{databaseId}/recomms/users/#{@user_id}/users/"
    end
  end
end

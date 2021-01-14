#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Recommend users that are likely to be interested in a given item.
  #
  #It is also possible to use POST HTTP method (for example in case of very long ReQL filter) - query parameters then become body parameters.
  #
  #The returned users are sorted by predicted interest in the item (first user being the most interested).
  #
  class RecommendUsersToItem < ApiRequest
    attr_reader :item_id, :count, :scenario, :cascade_create, :return_properties, :included_properties, :filter, :booster, :logic, :diversity, :expert_settings, :return_ab_group
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +item_id+ -> ID of the item for which the recommendations are to be generated.
  #   - +count+ -> Number of items to be recommended (N for the top-N recommendation).
  #
  # * *Optional arguments (given as hash optional)*
  #   - +scenario+ -> Scenario defines a particular application of recommendations. It can be for example "homepage", "cart" or "emailing".
  #
  #You can set various settings to the [scenario](https://docs.recombee.com/scenarios.html) in the [Admin UI](https://admin.recombee.com). You can also see performance of each scenario in the Admin UI separately, so you can check how well each application performs.
  #
  #The AI which optimizes models in order to get the best results may optimize different scenarios separately, or even use different models in each of the scenarios.
  #
  #   - +cascadeCreate+ -> If item of given *itemId* doesn't exist in the database, it creates the missing item.
  #   - +returnProperties+ -> With `returnProperties=true`, property values of the recommended users are returned along with their IDs in a JSON dictionary. The acquired property values can be used for easy displaying the recommended users. 
  #
  #Example response:
  #```
  #  {
  #    "recommId": "039b71dc-b9cc-4645-a84f-62b841eecfce",
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
  #   - +includedProperties+ -> Allows to specify, which properties should be returned when `returnProperties=true` is set. The properties are given as a comma-separated list. 
  #
  #Example response for `includedProperties=country`:
  #```
  #  {
  #    "recommId": "b2b355dd-972a-4728-9c6b-2dc229db0678",
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
  #   - +filter+ -> Boolean-returning [ReQL](https://docs.recombee.com/reql.html) expression which allows you to filter recommended items based on the values of their attributes.
  #
  #Filters can be also assigned to a [scenario](https://docs.recombee.com/scenarios.html) in the [Admin UI](https://admin.recombee.com).
  #
  #   - +booster+ -> Number-returning [ReQL](https://docs.recombee.com/reql.html) expression which allows you to boost recommendation rate of some items based on the values of their attributes.
  #
  #Boosters can be also assigned to a [scenario](https://docs.recombee.com/scenarios.html) in the [Admin UI](https://admin.recombee.com).
  #
  #   - +logic+ -> Logic specifies particular behavior of the recommendation models. You can pick tailored logic for your domain and use case.
  #See [this section](https://docs.recombee.com/recommendation_logics.html) for list of available logics and other details.
  #
  #The difference between `logic` and `scenario` is that `logic` specifies mainly behavior, while `scenario` specifies the place where recommendations are shown to the users.
  #
  #Logic can be also set to a [scenario](https://docs.recombee.com/scenarios.html) in the [Admin UI](https://admin.recombee.com).
  #
  #   - +diversity+ -> **Expert option** Real number from [0.0, 1.0] which determines how much mutually dissimilar should the recommended items be. The default value is 0.0, i.e., no diversification. Value 1.0 means maximal diversification.
  #
  #   - +expertSettings+ -> Dictionary of custom options.
  #
  #   - +returnAbGroup+ -> If there is a custom AB-testing running, return name of group to which the request belongs.
  #
  #
    def initialize(item_id, count, optional = {})
      @item_id = item_id
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
      @expert_settings = optional['expertSettings']
      @return_ab_group = optional['returnAbGroup']
      @optional = optional
      @timeout = 50000
      @ensure_https = false
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["scenario","cascadeCreate","returnProperties","includedProperties","filter","booster","logic","diversity","expertSettings","returnAbGroup"].include? par
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
      "/{databaseId}/recomms/items/#{@item_id}/users/"
    end
  end
end

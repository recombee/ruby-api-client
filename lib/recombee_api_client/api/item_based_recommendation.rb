#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Recommends set of items that are somehow related to one given item, *X*. Typical scenario for using item-based recommendation is when user *A* is viewing *X*. Then you may display items to the user that he might be also interested in. Item-recommendation request gives you Top-N such items, optionally taking the target user *A* into account.
  #
  class ItemBasedRecommendation < ApiRequest
    attr_reader :item_id, :count, :target_user_id, :user_impact, :filter, :booster, :allow_nonexistent, :cascade_create, :scenario, :diversity, :min_relevance, :rotation_rate, :rotation_time
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +item_id+ -> ID of the item recommendations for which are to be generated.
  #   - +count+ -> Number of items to be recommended (N for the top-N recommendation).
  #
  # * *Optional arguments (given as hash optional)*
  #   - +targetUserId+ -> ID of the user who will see the recommendations.
  #   - +userImpact+ -> If *targetUserId* parameter is present, the recommendations are biased towards the user given. Using *userImpact*, you may control this bias. For an extreme case of `userImpact=0.0`, the interactions made by the user are not taken into account at all (with the exception of history-based blacklisting), for `userImpact=1.0`, you'll get user-based recommendation. The default value is `0.1`
  #
  #   - +filter+ -> Boolean-returning [ReQL](https://docs.recombee.com/reql.html) expression which allows you to filter recommended items based on the values of their attributes.
  #   - +booster+ -> Number-returning [ReQL](https://docs.recombee.com/reql.html) expression which allows you to boost recommendation rate of some items based on the values of their attributes.
  #   - +allowNonexistent+ -> Instead of causing HTTP 404 error, returns some (non-personalized) recommendations if either item of given *itemId* or user of given *targetUserId* does not exist in the database. It creates neither of the missing entities in the database.
  #   - +cascadeCreate+ -> If item of given *itemId* or user of given *targetUserId* doesn't exist in the database, it creates the missing enity/entities and returns some (non-personalized) recommendations. This allows for example rotations in the following recommendations for the user of given *targetUserId*, as the user will be already known to the system.
  #   - +scenario+ -> Scenario defines a particular application of recommendations. It can be for example "homepage" or "cart". The AI which optimizes models in order to get the best results may optimize different scenarios separately, or even use different models in each of the scenarios.
  #   - +diversity+ -> **Expert option** Real number from [0.0, 1.0] which determines how much mutually dissimilar should the recommended items be. The default value is 0.0, i.e., no diversification. Value 1.0 means maximal diversification.
  #
  #   - +minRelevance+ -> **Expert option** Specifies the threshold of how much relevant must the recommended items be to the user. Possible values one of: "low", "medium", "high". The default value is "low", meaning that the system attempts to recommend number of items equal to *count* at any cost. If there are not enough data (such as interactions or item properties), this may even lead to bestseller-based recommendations to be appended to reach the full *count*. This behavior may be suppressed by using "medium" or "high" values. In such case, the system only recommends items of at least the requested qualit, and may return less than *count* items when there is not enough data to fulfill it.
  #
  #   - +rotationRate+ -> **Expert option** If your users browse the system in real-time, it may easily happen that you wish to offer them recommendations multiple times. Here comes the question: how much should the recommendations change? Should they remain the same, or should they rotate? Recombee API allows you to control this per-request in backward fashion. You may penalize an item for being recommended in the near past. For the specific user, `rotationRate=1` means maximal rotation, `rotationRate=0` means absolutely no rotation. You may also use, for example `rotationRate=0.2` for only slight rotation of recommended items.
  #
  #   - +rotationTime+ -> **Expert option** Taking *rotationRate* into account, specifies how long time it takes to an item to fully recover from the penalization. By example, `rotationTime=7200.0` means that items recommended more than 2 hours ago are definitely not penalized anymore. Currently, the penalization is linear, so for `rotationTime=7200.0`, an item is still penalized by `0.5` to the user after 1 hour. |
  #
  #
    def initialize(item_id, count, optional = {})
      @item_id = item_id
      @count = count
      @target_user_id = optional['targetUserId']
      @user_impact = optional['userImpact']
      @filter = optional['filter']
      @booster = optional['booster']
      @allow_nonexistent = optional['allowNonexistent']
      @cascade_create = optional['cascadeCreate']
      @scenario = optional['scenario']
      @diversity = optional['diversity']
      @min_relevance = optional['minRelevance']
      @rotation_rate = optional['rotationRate']
      @rotation_time = optional['rotationTime']
      @optional = optional
      @timeout = 3000
      @ensure_https = false
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["targetUserId","userImpact","filter","booster","allowNonexistent","cascadeCreate","scenario","diversity","minRelevance","rotationRate","rotationTime"].include? par
      end
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
  
    # Values of query path parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      params = {}
      params['count'] = @count
      params['targetUserId'] = @optional['targetUserId'] if @optional['targetUserId']
      params['userImpact'] = @optional['userImpact'] if @optional['userImpact']
      params['filter'] = @optional['filter'] if @optional['filter']
      params['booster'] = @optional['booster'] if @optional['booster']
      params['allowNonexistent'] = @optional['allowNonexistent'] if @optional['allowNonexistent']
      params['cascadeCreate'] = @optional['cascadeCreate'] if @optional['cascadeCreate']
      params['scenario'] = @optional['scenario'] if @optional['scenario']
      params['diversity'] = @optional['diversity'] if @optional['diversity']
      params['minRelevance'] = @optional['minRelevance'] if @optional['minRelevance']
      params['rotationRate'] = @optional['rotationRate'] if @optional['rotationRate']
      params['rotationTime'] = @optional['rotationTime'] if @optional['rotationTime']
      params
    end
  
    # Relative path to the endpoint
    def basic_path
      "/{databaseId}/items/#{@item_id}/recomms/"
    end
  
    # Relative path to the endpoint including query parameters
    def path
      p = "/{databaseId}/items/#{@item_id}/recomms/?count=#{@count}"
      if @optional.include? 'targetUserId'
        p += (p.include? '?') ? '&' : '?'
        p += "targetUserId=#{@optional['targetUserId']}"
      end
      if @optional.include? 'userImpact'
        p += (p.include? '?') ? '&' : '?'
        p += "userImpact=#{@optional['userImpact']}"
      end
      if @optional.include? 'filter'
        p += (p.include? '?') ? '&' : '?'
        p += "filter=#{@optional['filter']}"
      end
      if @optional.include? 'booster'
        p += (p.include? '?') ? '&' : '?'
        p += "booster=#{@optional['booster']}"
      end
      if @optional.include? 'allowNonexistent'
        p += (p.include? '?') ? '&' : '?'
        p += "allowNonexistent=#{@optional['allowNonexistent']}"
      end
      if @optional.include? 'cascadeCreate'
        p += (p.include? '?') ? '&' : '?'
        p += "cascadeCreate=#{@optional['cascadeCreate']}"
      end
      if @optional.include? 'scenario'
        p += (p.include? '?') ? '&' : '?'
        p += "scenario=#{@optional['scenario']}"
      end
      if @optional.include? 'diversity'
        p += (p.include? '?') ? '&' : '?'
        p += "diversity=#{@optional['diversity']}"
      end
      if @optional.include? 'minRelevance'
        p += (p.include? '?') ? '&' : '?'
        p += "minRelevance=#{@optional['minRelevance']}"
      end
      if @optional.include? 'rotationRate'
        p += (p.include? '?') ? '&' : '?'
        p += "rotationRate=#{@optional['rotationRate']}"
      end
      if @optional.include? 'rotationTime'
        p += (p.include? '?') ? '&' : '?'
        p += "rotationTime=#{@optional['rotationTime']}"
      end
      p
    end
  end
end

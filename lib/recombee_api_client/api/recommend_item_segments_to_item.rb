#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'
  
  ##
  #Recommends Segments from a [Segmentation](https://docs.recombee.com/segmentations.html) that are the most relevant to a particular item.
  #
  #Based on the used Segmentation, this endpoint can be used for example for:
  #
  #  - Recommending the related categories
  #  - Recommending the related genres
  #  - Recommending the related brands
  #  - Recommending the related artists
  #
  #You need to set the used Segmentation the Admin UI in the [Scenario settings](https://docs.recombee.com/scenarios) prior to using this endpoint.
  #
  #The returned segments are sorted by relevance (first segment being the most relevant).
  #
  #It is also possible to use POST HTTP method (for example in case of very long ReQL filter) - query parameters then become body parameters.
  #
  class RecommendItemSegmentsToItem < ApiRequest
    attr_reader :item_id, :target_user_id, :count, :scenario, :cascade_create, :filter, :booster, :logic, :expert_settings, :return_ab_group
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +item_id+ -> ID of the item for which the recommendations are to be generated.
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
  #   - +count+ -> Number of item segments to be recommended (N for the top-N recommendation).
  #
  #
  # * *Optional arguments (given as hash optional)*
  #   - +scenario+ -> Scenario defines a particular application of recommendations. It can be, for example, "homepage", "cart", or "emailing".
  #
  #You can set various settings to the [scenario](https://docs.recombee.com/scenarios.html) in the [Admin UI](https://admin.recombee.com). You can also see the performance of each scenario in the Admin UI separately, so you can check how well each application performs.
  #
  #The AI that optimizes models to get the best results may optimize different scenarios separately or even use different models in each of the scenarios.
  #
  #   - +cascadeCreate+ -> If the user does not exist in the database, returns a list of non-personalized recommendations and creates the user in the database. This allows, for example, rotations in the following recommendations for that user, as the user will be already known to the system.
  #
  #   - +filter+ -> Boolean-returning [ReQL](https://docs.recombee.com/reql.html) expression which allows you to filter recommended segments based on the `segmentationId`.
  #
  #   - +booster+ -> Number-returning [ReQL](https://docs.recombee.com/reql.html) expression which allows you to boost recommendation rate of some segments based on the `segmentationId`.
  #
  #   - +logic+ -> Logic specifies the particular behavior of the recommendation models. You can pick tailored logic for your domain and use case.
  #See [this section](https://docs.recombee.com/recommendation_logics.html) for a list of available logics and other details.
  #
  #The difference between `logic` and `scenario` is that `logic` specifies mainly behavior, while `scenario` specifies the place where recommendations are shown to the users.
  #
  #Logic can also be set to a [scenario](https://docs.recombee.com/scenarios.html) in the [Admin UI](https://admin.recombee.com).
  #
  #   - +expertSettings+ -> Dictionary of custom options.
  #
  #   - +returnAbGroup+ -> If there is a custom AB-testing running, return the name of the group to which the request belongs.
  #
  #
    def initialize(item_id, target_user_id, count, optional = {})
      @item_id = item_id
      @target_user_id = target_user_id
      @count = count
      optional = normalize_optional(optional)
      @scenario = optional['scenario']
      @cascade_create = optional['cascadeCreate']
      @filter = optional['filter']
      @booster = optional['booster']
      @logic = optional['logic']
      @expert_settings = optional['expertSettings']
      @return_ab_group = optional['returnAbGroup']
      @optional = optional
      @timeout = 3000
      @ensure_https = false
      @optional.each do |par, _|
        fail UnknownOptionalParameter.new(par) unless ["scenario","cascadeCreate","filter","booster","logic","expertSettings","returnAbGroup"].include? par
      end
    end
  
    # HTTP method
    def method
      :post
    end
  
    # Values of body parameters as a Hash
    def body_parameters
      p = Hash.new
      p['targetUserId'] = @target_user_id
      p['count'] = @count
      p['scenario'] = @optional['scenario'] if @optional.include? 'scenario'
      p['cascadeCreate'] = @optional['cascadeCreate'] if @optional.include? 'cascadeCreate'
      p['filter'] = @optional['filter'] if @optional.include? 'filter'
      p['booster'] = @optional['booster'] if @optional.include? 'booster'
      p['logic'] = @optional['logic'] if @optional.include? 'logic'
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
      "/{databaseId}/recomms/items/#{@item_id}/item-segments/"
    end
  end
end

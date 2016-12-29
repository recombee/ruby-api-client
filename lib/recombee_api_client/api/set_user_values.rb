module RecombeeApiClient
  require_relative 'set_values'
  require_relative '../errors'
  
  ##
  #Set/update (some) property values of a given user. The properties (columns) must be previously created by [Add user property](https://docs.recombee.com/api.html#add-user-property).
  #
  class SetUserValues < SetValues
    attr_reader :user_id
    attr_accessor :timeout
    attr_accessor :ensure_https
  
  ##
  # * *Required arguments*
  #   - +user_id+ -> ID of the user which will be modified.
  #
  #   - +values+ -> The values for the individual properties.
  #
  #Example of body:
  #```
  #  {
  #    "country": "US",
  #    "sex": "F",
  #  }
  #```
  #
  # * *Optional arguments (given as hash optional)*
  #   - +cascadeCreate+ -> Sets whether the item should be created  if not present in the database.
  #
    def initialize(user_id, values, optional = {})
      super(values, optional)
      @user_id = user_id
      @timeout = 1000
      @ensure_https = false
    end

    # Relative path to the endpoint
    def path
      "/{databaseId}/users/#{@user_id}"
    end
  end
end

#
# This file is auto-generated, do not edit
#

module RecombeeApiClient
  require_relative 'request'
  require_relative '../errors'

  ##
  # Completely erases all your data, including items, item properties, series, user database, purchases, ratings, detail views, and bookmarks. Make sure the request is never executed in the production environment! Resetting your database is irreversible.
  #
  class ResetDatabase < ApiRequest
    attr_accessor :timeout, :ensure_https

    ##
    #
    def initialize
      @timeout = 100_000
      @ensure_https = false
    end

    # HTTP method
    def method
      :delete
    end

    # Values of body parameters as a Hash
    def body_parameters
      {}
    end

    # Values of query parameters as a Hash.
    # name of parameter => value of the parameter
    def query_parameters
      {}
    end

    # Relative path to the endpoint
    def path
      '/{databaseId}/'
    end
  end
end

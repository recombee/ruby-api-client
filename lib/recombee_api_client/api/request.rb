module RecombeeApiClient
  ##
  # Parent class for API requests
  #
  class ApiRequest
    require_relative 'hash_normalizer'
    include RecombeeApiClient::HashNormalizer
  end
end

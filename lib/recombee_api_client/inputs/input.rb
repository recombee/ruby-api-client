module RecombeeApiClient
  ##
  # Parent class for all inputs
  #
  class Input
    require_relative '../utils/hash_normalizer'
    include RecombeeApiClient::HashNormalizer
  end
end

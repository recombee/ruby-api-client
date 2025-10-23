module RecombeeApiClient
  ##
  # Module to convert Ruby conventions to Recombee's API namings
  #
  module HashNormalizer
    def normalize_hash_to_camel_case(h)
      return h unless h.is_a?(Hash)

      h_new = {}
      h.each do |k, v|
        key = k.is_a?(String) ? camelize(k) : camelize(k.to_s)
        h_new[key] = v
      end
      h_new
    end

    def camelize(str)
      str.gsub(/_(.)/) { |_e| ::Regexp.last_match(1).upcase }
    end
  end
end

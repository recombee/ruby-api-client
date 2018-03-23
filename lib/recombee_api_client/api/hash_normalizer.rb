module RecombeeApiClient
  ##
  # Module to convert Ruby conventions to Recombee's API namings
  #
  module HashNormalizer
    def normalize_optional opts
      opts_new = {}
      opts.each do |k,v|
        case k
        when String then opts_new[camelize(k)] = opts.delete(k)
        when Symbol then opts_new[camelize(k.to_s)] = opts.delete(k)
        end
      end
      opts_new
    end

    def camelize str
      str.gsub(/_(.)/) {|e| $1.upcase}
    end
  end
end

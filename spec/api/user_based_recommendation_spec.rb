require 'spec_helper'
require_relative "recommendation"

describe RecombeeApiClient::UserBasedRecommendation do
  it_behaves_like "recommendation"
end
require 'spec_helper'
require_relative "recommendation"

describe RecombeeApiClient::ItemBasedRecommendation do
  it_behaves_like "recommendation"
end
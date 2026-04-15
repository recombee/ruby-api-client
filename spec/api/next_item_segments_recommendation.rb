#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'next item segments recommendation' do
  include_context 'set environment'

  it 'rejects request with invalid recommId' do
    req = RecommendNextItemSegments.new('invalid_recomm_id', 5)
    expect { @client.send(req) }.to(raise_exception do |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 400
    end)
  end

  it 'rejects request to recommId which does not return item-segments' do
    req = RecommendItemsToUser.new('entity_id', 3)
    resp = @client.send(req)
    req = described_class.new(resp['recommId'], 5)
    expect { @client.send(req) }.to(raise_exception do |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 400
    end)
  end
end

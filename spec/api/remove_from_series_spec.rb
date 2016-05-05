require 'spec_helper'
require_relative 'set_environment'

describe RecombeeApiClient::RemoveFromSeries do
  include_context 'set environment'

  it 'does not fail when removing item that is contained in the set' do
    req = described_class.new('entity_id', 'item', 'entity_id', 1)
    expect { @client.send(req) }.not_to raise_exception
  end

  it 'fails when removing item which have different time' do
    req = described_class.new('entity_id', 'item', 'entity_id', 0)
    expect { @client.send(req) }.to raise_exception { |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 404
    }
  end

  it 'fails when removing item that is not contained in the set' do
    req = described_class.new('entity_id', 'item', 'not_contained', 1)
    expect { @client.send(req) }.to raise_exception { |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 404
    }
  end
end
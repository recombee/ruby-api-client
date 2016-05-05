require 'spec_helper'
require_relative 'set_environment'

describe RecombeeApiClient::AddRating do
  include_context 'set environment'

  it 'does not fail with cascadeCreate' do
    dv = described_class.new('u_id', 'i_id', 0, 1, 'cascadeCreate' => true)
    expect { @client.send(dv) }.not_to raise_exception
  end

  it 'does not fail with existing item and user' do
    dv = described_class.new('entity_id', 'entity_id', 0, 0)
    expect { @client.send(dv) }.not_to raise_exception
  end

  it 'fails with nonexisting item id' do
    dv = described_class.new('entity_id', 'i_id', 0, -1)
    expect { @client.send(dv) }.to raise_exception { |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 404
    }
  end

  it 'fails with nonexisting user id' do
    dv = described_class.new('u_id', 'entity_id', 0, 0.5)
    expect { @client.send(dv) }.to raise_exception { |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 404
    }
  end

  it 'fails with invalid time' do
    dv = described_class.new('entity_id', 'entity_id', -15, 0)
    expect { @client.send(dv) }.to raise_exception { |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 400
    }
  end

  it 'fails with invalid rating' do
    dv = described_class.new('entity_id', 'entity_id', 15, -2)
    expect { @client.send(dv) }.to raise_exception { |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 400
    }
  end

  it 'really stores interaction to the system' do
    dv = described_class.new('u_id', 'i_id', 0, 0.3, 'cascadeCreate' => true)
    expect { @client.send(dv) }.not_to raise_exception
    expect { @client.send(dv) }.to raise_exception { |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 409
    }
  end
end
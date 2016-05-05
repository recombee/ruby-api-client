require 'spec_helper'
require_relative 'set_environment'

shared_examples 'add interaction' do
  include_context 'set environment'

  it 'does not fail with cascadeCreate' do
    req = described_class.new('u_id', 'i_id', 0, 'cascadeCreate' => true)
    expect { @client.send(req) }.not_to raise_exception
  end

  it 'does not fail with existing item and user' do
    req = described_class.new('entity_id', 'entity_id', 0)
    expect { @client.send(req) }.not_to raise_exception
  end

  it 'fails with nonexisting item id' do
    req = described_class.new('entity_id', 'i_id', 0)
    expect { @client.send(req) }.to raise_exception { |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 404
    }
  end

  it 'fails with nonexisting user id' do
    req = described_class.new('u_id', 'entity_id', 0)
    expect { @client.send(req) }.to raise_exception { |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 404
    }
  end

  it 'fails with invalid time' do
    req = described_class.new('entity_id', 'entity_id', -15)
    expect { @client.send(req) }.to raise_exception { |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 400
    }
  end

  it 'really stores interaction to the system' do
    req = described_class.new('u_id', 'i_id', 0, 'cascadeCreate' => true)
    expect { @client.send(req) }.not_to raise_exception
    expect { @client.send(req) }.to raise_exception { |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 409
    }
  end
end

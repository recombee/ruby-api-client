require 'spec_helper'
require_relative 'set_environment'

shared_examples 'delete entity' do
  include_context 'set environment'

  it 'does not fail with existing entity id' do
    delete_req = described_class.new('entity_id')
    expect { @client.send(delete_req) }.not_to raise_exception
  end

  it 'really deletes entity' do
    delete_req = described_class.new('entity_id')
    expect { @client.send(delete_req) }.not_to raise_exception
    expect { @client.send(delete_req) }.to raise_exception { |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 404
    }
  end

  it 'fails with invalid entity id' do
    delete_req = described_class.new('not_valid_id-*.?!')
    expect { @client.send(delete_req) }.to raise_exception { |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 400
    }
  end

  it 'fails with non-existing entity' do
    delete_req = described_class.new('valid_id')
    expect { @client.send(delete_req) }.to raise_exception { |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 404
    }
  end
end

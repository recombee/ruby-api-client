require 'spec_helper'
require_relative 'set_environment'

shared_examples 'delete property' do
  include_context 'set environment'

  it 'does not fail with existing property' do
    delete_req = described_class.new('int_property')
    expect { @client.send(delete_req) }.not_to raise_exception
  end

  it 'fails with invalid property' do
    delete_req = described_class.new('not_valid_id-*.?!')
    expect { @client.send(delete_req) }.to raise_exception { |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 400
    }
  end

  it 'fails with non-existing property' do
    delete_req = described_class.new('not_existing')
    expect { @client.send(delete_req) }.to raise_exception { |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 404
    }
  end
end

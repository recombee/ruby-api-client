require 'spec_helper'
require_relative 'set_environment'

describe RecombeeApiClient::MergeUsers do
  include_context 'set environment'

  it 'does not fail with existing users' do
    @client.send(AddUser.new('target'))
    req = described_class.new('target', 'entity_id')
    expect { @client.send(req) }.not_to raise_exception
  end

  it 'fails with nonexisting user' do
    req = described_class.new('target', 'entity_id')
    expect { @client.send(req) }.to raise_exception { |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 404
    }
  end

end
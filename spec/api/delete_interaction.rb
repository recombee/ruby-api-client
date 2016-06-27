require 'spec_helper'
require_relative 'set_environment'

shared_examples 'delete interaction' do
  include_context 'set environment'
  include_context 'set interactions'

  it 'does not fail with existing entity id' do
    delete_req = described_class.new('user', 'item', 'timestamp' => 0)
    expect { @client.send(delete_req) }.not_to raise_exception
  end

  it 'really deletes the interaction' do
    delete_req = described_class.new('user', 'item')
    expect { @client.send(delete_req) }.not_to raise_exception
    expect { @client.send(delete_req) }.to raise_exception { |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 404
    }
  end
end

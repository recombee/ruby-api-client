require 'spec_helper'
require_relative 'set_environment'

shared_examples 'add property' do
  include_context 'set environment'

  it 'does not fail with valid name and type' do
    add_req = described_class.new('number', 'int')
    expect { @client.send(add_req) }.not_to raise_exception
    add_req = described_class.new('str', 'string')
    expect { @client.send(add_req) }.not_to raise_exception
  end

  it 'fails with invalid type' do
    add_req = described_class.new('prop', 'integer')
    expect { @client.send(add_req) }.to raise_exception { |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 400
    }
  end

  it 'really stores property to the system' do
    add_req = described_class.new('number', 'int')
    expect { @client.send(add_req) }.not_to raise_exception
    expect { @client.send(add_req) }.to raise_exception { |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 409
    }
  end
end

#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'add property' do
include_context 'set environment'

  it 'does not fail with valid name and type' do
    req = described_class.new('number','int')
    resp = @client.send(req)
    req = described_class.new('str','string')
    resp = @client.send(req)
  end

  it 'fails with invalid type' do
    req = described_class.new('prop','integer')
    expect { @client.send(req) }.to raise_exception { |exception|
       expect(exception).to be_a(RecombeeApiClient::ResponseError)
       expect(exception.status_code).to eq 400
     }
  end

  it 'really stores property to the system' do
    req = described_class.new('number2','int')
    resp = @client.send(req)
    expect { @client.send(req) }.to raise_exception { |exception|
       expect(exception).to be_a(RecombeeApiClient::ResponseError)
       expect(exception.status_code).to eq 409
     }
  end

end

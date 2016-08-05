#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'add entity' do
include_context 'set environment'

  it 'does not fail with valid entity id' do
    req = described_class.new('valid_id')
    resp = @client.send(req)
  end

  it 'fails with invalid entity id' do
    req = described_class.new('not_valid_id-*.?!')
    expect { @client.send(req) }.to raise_exception { |exception|
       expect(exception).to be_a(RecombeeApiClient::ResponseError)
       expect(exception.status_code).to eq 400
     }
  end

  it 'really stores entity to the system' do
    req = described_class.new('valid_id2')
    resp = @client.send(req)
    expect { @client.send(req) }.to raise_exception { |exception|
       expect(exception).to be_a(RecombeeApiClient::ResponseError)
       expect(exception.status_code).to eq 409
     }
  end

end

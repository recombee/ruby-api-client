#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'add rating' do
include_context 'set environment'

  it 'does not fail with cascadeCreate' do
    req = described_class.new('u_id','i_id',1,{'cascadeCreate' => true,'additionalData' => {'answer' => 42}})
    resp = @client.send(req)
  end

  it 'does not fail with existing item and user' do
    req = described_class.new('entity_id','entity_id',0)
    resp = @client.send(req)
  end

  it 'fails with nonexisting item id' do
    req = described_class.new('entity_id','nonex_id',-1)
    expect { @client.send(req) }.to raise_exception { |exception|
       expect(exception).to be_a(RecombeeApiClient::ResponseError)
       expect(exception.status_code).to eq 404
     }
  end

  it 'fails with nonexisting user id' do
    req = described_class.new('nonex_id','entity_id',0.5)
    expect { @client.send(req) }.to raise_exception { |exception|
       expect(exception).to be_a(RecombeeApiClient::ResponseError)
       expect(exception.status_code).to eq 404
     }
  end

  it 'fails with invalid rating' do
    req = described_class.new('entity_id','entity_id',-2)
    expect { @client.send(req) }.to raise_exception { |exception|
       expect(exception).to be_a(RecombeeApiClient::ResponseError)
       expect(exception.status_code).to eq 400
     }
  end

  it 'really stores interaction to the system' do
    req = described_class.new('u_id','i_id',0.3,{'cascadeCreate' => true,'timestamp' => 5})
    resp = @client.send(req)
    expect { @client.send(req) }.to raise_exception { |exception|
       expect(exception).to be_a(RecombeeApiClient::ResponseError)
       expect(exception.status_code).to eq 409
     }
  end

end

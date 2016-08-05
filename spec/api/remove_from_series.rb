#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'remove from series' do
include_context 'set environment'

  it 'fails when removing item which have different time' do
    req = described_class.new('entity_id','item','entity_id',0)
    expect { @client.send(req) }.to raise_exception { |exception|
       expect(exception).to be_a(RecombeeApiClient::ResponseError)
       expect(exception.status_code).to eq 404
     }
  end

  it 'does not fail when removing item that is contained in the set' do
    req = described_class.new('entity_id','item','entity_id',1)
    resp = @client.send(req)
  end

  it 'fails when removing item that is not contained in the set' do
    req = described_class.new('entity_id','item','not_contained',1)
    expect { @client.send(req) }.to raise_exception { |exception|
       expect(exception).to be_a(RecombeeApiClient::ResponseError)
       expect(exception.status_code).to eq 404
     }
  end

end

#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'remove from series' do
include_context 'set environment'

  it 'does not fail when removing item that is contained in the set' do
    req = described_class.new('entity_id','item','entity_id')
    resp = @client.send(req)
  end

  it 'fails when removing item that is not contained in the set' do
    req = described_class.new('entity_id','item','not_contained')
    expect { @client.send(req) }.to raise_exception { |exception|
       expect(exception).to be_a(RecombeeApiClient::ResponseError)
       expect(exception.status_code).to eq 404
     }
  end

end

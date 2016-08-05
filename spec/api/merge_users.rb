#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'merge users' do
include_context 'set environment'

  it 'does not fail with existing users' do
    req = AddUser.new('target')
    resp = @client.send(req)
    req = described_class.new('target','entity_id')
    resp = @client.send(req)
  end

  it 'fails with nonexisting user' do
    req = described_class.new('nonex_id','entity_id')
    expect { @client.send(req) }.to raise_exception { |exception|
       expect(exception).to be_a(RecombeeApiClient::ResponseError)
       expect(exception.status_code).to eq 404
     }
  end

end

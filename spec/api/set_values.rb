#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'set values' do
include_context 'set environment'

  it 'does not fail with existing entity and property' do
    req = described_class.new('entity_id',{'int_property' => 5})
    resp = @client.send(req)
  end

  it 'does not fail with non-ASCII string' do
    req = described_class.new('entity_id',{'str_property' => 'šřžذ的‎'})
    resp = @client.send(req)
  end

  it 'sets multiple properties' do
    req = described_class.new('entity_id',{'int_property' => 5,'str_property' => 'test'})
    resp = @client.send(req)
  end

  it 'does not fail with !cascadeCreate' do
    req = described_class.new('new_entity',{'int_property' => 5,'str_property' => 'test','!cascadeCreate' => true})
    resp = @client.send(req)
  end

  it 'does not fail with cascadeCreate optional parameter' do
    req = described_class.new('new_entity2',{'int_property' => 5,'str_property' => 'test'},{'cascadeCreate' => true})
    resp = @client.send(req)
  end

  it 'fails with nonexisting entity' do
    req = described_class.new('nonexisting',{'int_property' => 5})
    expect { @client.send(req) }.to raise_exception { |exception|
       expect(exception).to be_a(RecombeeApiClient::ResponseError)
       expect(exception.status_code).to eq 404
     }
  end

end

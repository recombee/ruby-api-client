#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'insert to series' do
  include_context 'set environment'

  it 'does not fail when inserting existing item into existing set' do
    req = AddItem.new('new_item')
    @client.send(req)
    req = described_class.new('entity_id', 'item', 'new_item', 3)
    @client.send(req)
  end

  it 'does not fail when cascadeCreate is used' do
    req = described_class.new('new_set', 'item', 'new_item2', 1, { 'cascadeCreate' => true })
    @client.send(req)
  end

  it 'really inserts item to the set' do
    req = AddItem.new('new_item3')
    @client.send(req)
    req = described_class.new('entity_id', 'item', 'new_item3', 2)
    @client.send(req)
    expect { @client.send(req) }.to(raise_exception do |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 409
    end)
  end
end

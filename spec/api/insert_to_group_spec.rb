require 'spec_helper'
require_relative 'set_environment'

describe RecombeeApiClient::InsertToGroup do
  include_context 'set environment'

  it 'does not fail when inserting existing item into existing set' do
    @client.send(AddItem.new('new_item'))
    insert_req = InsertToGroup.new('entity_id', 'item', 'new_item')
    expect { @client.send(insert_req) }.not_to raise_exception
  end

  it 'does not fail when cascadeCreate is used' do
    insert_req = InsertToGroup.new('new_set', 'item', 'new_item', 'cascadeCreate' => true)
    expect { @client.send(insert_req) }.not_to raise_exception
  end

  it 'really inserts item to the set' do
    @client.send(AddItem.new('new_item'))
    insert_req = InsertToGroup.new('entity_id', 'item', 'new_item')
    expect { @client.send(insert_req) }.not_to raise_exception
    expect { @client.send(insert_req) }.to raise_exception { |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 409
    }
  end
end
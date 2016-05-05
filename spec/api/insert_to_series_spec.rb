require 'spec_helper'
require_relative 'set_environment'

describe RecombeeApiClient::InsertToSeries do
  include_context 'set environment'

  it 'does not fail when inserting existing item into existing set' do
    @client.send(AddItem.new('new_item'))
    insert_req = InsertToSeries.new('entity_id', 'item', 'new_item', 3)
    expect { @client.send(insert_req) }.not_to raise_exception
  end

  it 'does not fail when cascadeCreate is used' do
    insert_req = InsertToSeries.new('new_set', 'item', 'new_item', 1, 'cascadeCreate' => true)
    expect { @client.send(insert_req) }.not_to raise_exception
  end

  it 'really inserts item to the set' do
    @client.send(AddItem.new('new_item'))
    insert_req = InsertToSeries.new('entity_id', 'item', 'new_item', 2)
    expect { @client.send(insert_req) }.not_to raise_exception
    expect { @client.send(insert_req) }.to raise_exception { |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 409
    }
  end
end
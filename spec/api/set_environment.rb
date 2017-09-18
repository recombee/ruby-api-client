require 'spec_helper'

include RecombeeApiClient

RSpec.shared_context 'set environment', a: :b do
  before(:each) do
    @client = RecombeeClient.new('client-test', 'jGGQ6ZKa8rQ1zTAyxTc0EMn55YPF7FJLUtaMLhbsGxmvwxgTwXYqmUk5xVZFw98L')

    requests = Batch.new([
        ResetDatabase.new,
        AddItem.new('entity_id'),
        AddUser.new('entity_id'),
        AddSeries.new('entity_id'),
        AddGroup.new('entity_id'),
        InsertToGroup.new('entity_id', 'item', 'entity_id'),
        InsertToSeries.new('entity_id', 'item', 'entity_id', 1),
        AddItemProperty.new('int_property', 'int'),
        AddItemProperty.new('str_property', 'string'),
        SetItemValues.new('entity_id', {'int_property' => 42, 'str_property' => 'hello'}),
        AddUserProperty.new('int_property', 'int'),
        AddUserProperty.new('str_property', 'string'),
        SetUserValues.new('entity_id', {'int_property' => 42, 'str_property' => 'hello'})        
    ])

    @client.send(requests)
  end
end

RSpec.shared_context 'set interactions', a: :b do
  before(:each) do

    requests = Batch.new([

        AddUser.new('user'),
        AddItem.new('item'),
        AddDetailView.new('user', 'item', 'timestamp' => 0),
        AddPurchase.new('user', 'item', 'timestamp' => 0),
        AddRating.new('user', 'item', -1, 'timestamp' => 0),
        AddCartAddition.new('user', 'item', 'timestamp' => 0),
        AddBookmark.new('user', 'item', 'timestamp' => 0),
        SetViewPortion.new('user', 'item', 1, 'timestamp' => 0)
    ])

    @client.send(requests)
  end
end

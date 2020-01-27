require 'spec_helper'

include RecombeeApiClient

RSpec.shared_context 'set environment', a: :b do
  before(:each) do
    @client = RecombeeClient.new('client-test', 'jGGQ6ZKa8rQ1zTAyxTc0EMn55YPF7FJLUtaMLhbsGxmvwxgTwXYqmUk5xVZFw98L')

    @client.send(ResetDatabase.new)

    while true
      begin
        @client.send(ListItems.new)
      rescue ResponseError
        # Wait until DB is erased
        next
      end
      break
    end

    requests = Batch.new([
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

RSpec.shared_context 'set recomm entities', a: :b do

  before(:each) do
    num = 100
    probability_purchased = 0.1

    my_users = (1..num).map { |i| "user-#{i}" }
    my_items = (1..num).map { |i| "item-#{i}" }

    my_purchases = []
    my_users.each do |user|
      p = my_items.select { |_| rand(0.0..1.0) < probability_purchased }
      p.each { |item| my_purchases.push('userId' => user, 'itemId' => item) }
    end

    @client.send(Batch.new(my_users.map { |userId| AddUser.new(userId) }))
    @client.send(Batch.new([AddItemProperty.new('answer', 'int'), AddItemProperty.new('id2', 'string'), AddItemProperty.new('empty', 'string')]))
    @client.send(Batch.new(my_items.map { |itemId| SetItemValues.new(itemId, {'answer' => 42, 'id2' => itemId, '!cascadeCreate' => true}) }))
    @client.send(Batch.new(my_purchases.map { |p| AddPurchase.new(p['userId'], p['itemId'], 'timestamp' => 0) }))
  end

end

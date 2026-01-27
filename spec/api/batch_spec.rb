require 'spec_helper'
require_relative 'set_environment'

describe RecombeeApiClient::Batch do
  include_context 'set environment'

  it 'send various requests' do
    reqs = [
      DeleteItem.new('entity_id'),
      AddItemProperty.new('num', 'int'),
      AddItemProperty.new('time', 'timestamp'),
      SetItemValues.new('item1', {
                          'num' => 99,
                          '!cascadeCreate' => true
                        }),
      AddItem.new('item1'),
      SetItemValues.new('item2', {
                          'num' => 68,
                          'time' => 27,
                          '!cascadeCreate' => true
                        }),
      ListItems.new,
      ListItems.new('filter' => "'num' < 99"),
      DeleteItem.new('item1'),
      ListItems.new('filter' => "'num' >= 99"),
      AddCartAddition.new('user', 'item2'),
      AddCartAddition.new('user', 'item2', 'cascadeCreate' => true),
      RecommendItemsToUser.new('user_id', 25, filter: "'num'==68", cascade_create: true)
    ]
    repl = @client.send(Batch.new(reqs))

    codes = repl.map { |r| r['code'] }
    expect(codes).to match_array [200, 201, 201, 200, 409, 200, 200, 200, 200, 200, 404, 200, 200]
    expect(repl[12]['json']['recomms'][0]['id']).to eq 'item2'
  end

  it 'send large multi-part batch' do
    NUM = 23_648
    reqs = (1..NUM).map { |i| AddItem.new("item-#{i}") }
    repl = @client.send(Batch.new(reqs))
    expect(repl.size).to eq(NUM)

    repl.each { |r| expect(r['code']).to eq(201) }
  end
end

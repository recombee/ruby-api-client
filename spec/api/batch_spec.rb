require 'spec_helper'
require_relative 'set_environment'

describe RecombeeApiClient::Batch do
  include_context 'set environment'

  it 'send various requests' do

    reqs = [
      ResetDatabase.new,
      AddItemProperty.new('num', 'int'),
      AddItemProperty.new('time', 'timestamp'),
      SetItemValues.new('item1', {
                        'num' => 99,
                        '!cascadeCreate' => true}),
      AddItem.new('item1'),
      SetItemValues.new('item2', {
                        'num' => 68,
                        'time' => 27,
                        '!cascadeCreate' => true}),
      ListItems.new,
      ListItems.new('filter' => "'num' < 99"),
      DeleteItem.new('item1'),
      ListItems.new('filter' => "'num' >= 99"),
      AddCartAddition.new('user', 'item2', 0),
      AddCartAddition.new('user', 'item2', 0, 'cascadeCreate' => true)
    ]
    repl = @client.send(Batch.new(reqs))

    codes = repl.map{|r| r['code']}
    expect(codes).to match_array [200, 201, 201, 200, 409, 200, 200, 200, 200, 200, 404, 200]
    expect(repl[6]['json'].sort).to match_array ['item1', 'item2']
    expect(repl[7]['json'].sort).to match_array ['item2']
    expect(repl[9]['json'].sort).to match_array []
  end

end
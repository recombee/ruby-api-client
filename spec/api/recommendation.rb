require 'spec_helper'
require_relative 'set_environment'

shared_examples 'recommendation' do
  include_context 'set environment'

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

  # TODO: more tests

  it 'recommends' do
    recom_req = described_class.new('entity_id', 9)
    expect(@client.send(recom_req).size).to eq(9)
  end

  it 'rotates' do
    recom_req = described_class.new('entity_id', 9)
    recommended1 = @client.send(recom_req)
    expect(recommended1.size).to eq(9)
    recom_req = described_class.new('entity_id', 9, 'rotationRate' => 1)
    recommended2 = @client.send(recom_req)
    expect(recommended2.size).to eq(9)
    expect(recommended2).not_to include(recommended1)
  end

  it 'returns properties' do
    recom_req = described_class.new('entity_id', 9, 'returnProperties' => true, 'includedProperties'=>['answer', 'id2', 'empty'])
    recommended1 = @client.send(recom_req)
    recommended1.each do |rec|
      expect(rec['itemId']).to eq(rec['id2'])
      expect(rec['answer']).to eq(42)
      expect(rec).to include('empty')
    end
    recom_req = described_class.new('entity_id', 9, 'returnProperties' => true, 'includedProperties'=>'answer,id2')
    recommended1 = @client.send(recom_req)
    recommended1.each do |rec|
      expect(rec['itemId']).to eq(rec['id2'])
      expect(rec['answer']).to eq(42)
      expect(rec).not_to include('empty')
    end
  end

end

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
    @client.send(Batch.new(my_items.map { |itemId| AddItem.new(itemId) }))
    @client.send(Batch.new(my_purchases.map { |p| AddPurchase.new(p['userId'], p['itemId'], 0) }))
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
end

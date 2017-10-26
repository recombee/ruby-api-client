require 'spec_helper'
require_relative 'set_environment'

shared_examples 'recommendation' do
  include_context 'set recomm entities'
  # TODO: more tests

  it 'recommends' do
    recom_req = described_class.new('entity_id', 9)
    expect(@client.send(recom_req['recomms']).size).to eq(9)
  end

  it 'rotates' do
    recom_req = described_class.new('entity_id', 9)
    recommended1 = @client.send(recom_req)
    expect(recommended1['recomms'].size).to eq(9)
    recom_req = described_class.new('entity_id', 9, 'rotationRate' => 1)
    recommended1_ids = recommended1['recomms'].map {|r| r['id']}
    recommended2 = @client.send(recom_req)
    expect(recommended2['recomms'].size).to eq(9)
    expect(recommended2['recomms']).map {|r| r['id']}.not_to include(recommended1_ids)
  end

  it 'returns properties' do
    recom_req = described_class.new('entity_id', 9, 'returnProperties' => true, 'includedProperties'=>['answer', 'id2', 'empty'])
    recommended1 = @client.send(recom_req)
    recommended1['recomms'].each do |rec|
      expect(rec['id']).to eq(rec['values']['id2'])
      expect(rec['values']['answer']).to eq(42)
      expect(rec['values']).to include('empty')
    end
    recom_req = described_class.new('entity_id', 9, 'returnProperties' => true, 'includedProperties'=>'answer,id2')
    recommended1 = @client.send(recom_req)
    recommended1['recomms'].each do |rec|
      expect(rec['id']).to eq(rec['values']['id2'])
      expect(rec['values']['answer']).to eq(42)
      expect(rec['values']).not_to include('empty')
    end
  end

end

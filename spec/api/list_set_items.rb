require 'spec_helper'
require_relative 'set_environment'

shared_examples 'list set items' do
  include_context 'set environment'

  it 'lists set items' do
    response = @client.send(described_class.new('entity_id'))

    expect(response.size).to eq 1
    expect(response[0]['itemId']).to eq 'entity_id'
    expect(response[0]['itemType']).to eq 'item'
  end
end

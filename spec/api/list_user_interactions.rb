require 'spec_helper'
require_relative 'set_environment'

shared_examples 'list user interactions' do
  include_context 'set environment'
  include_context 'set interactions'

  it 'lists interactions' do
    list_req = described_class.new('user')
    response = @client.send(list_req)
    expect(response.size).to eq 1
    expect(response[0]['itemId']).to eq 'item'
    expect(response[0]['userId']).to eq 'user'
  end
end

require 'spec_helper'
require_relative 'set_environment'

shared_examples 'get values' do
  include_context 'set environment'

  it 'get values' do
    resp = @client.send(described_class.new('entity_id'))
    expect(resp.size).to eq 2
    expect(resp['int_property']).to eq 42
    expect(resp['str_property']).to eq 'hello'
  end
end

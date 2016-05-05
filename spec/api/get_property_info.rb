require 'spec_helper'
require_relative 'set_environment'

shared_examples 'get property info' do
  include_context 'set environment'

  it 'does not fail with existing properties' do
    resp = @client.send(described_class.new('int_property'))
    expect(resp['type']).to eq 'int'
    resp = @client.send(described_class.new('str_property'))
    expect(resp['type']).to eq 'string'
  end
end

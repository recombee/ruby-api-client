require 'spec_helper'
require_relative 'set_environment'

shared_examples 'list properties' do
  include_context 'set environment'
  include_context 'set interactions'

  it 'lists properties' do
    response = @client.send(described_class.new)
    
    expect(response.size).to eq 2
    props = {}
    response.each {|prop| props[prop['name']] = prop['type']}

    expect(props.keys.sort).to match_array ['int_property', 'str_property']
    expect(props['int_property']).to eq 'int'
    expect(props['str_property']).to eq 'string'
  end
end

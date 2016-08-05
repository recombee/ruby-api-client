#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'get values' do
include_context 'set environment'

  it 'gets values' do
    req = described_class.new('entity_id')
    resp = @client.send(req)
    expect(resp['int_property']).to eq 42
    expect(resp['str_property']).to eq 'hello'
  end

end

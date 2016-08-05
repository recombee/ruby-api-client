#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'get property info' do
include_context 'set environment'

  it 'does not fail with existing properties' do
    req = described_class.new('int_property')
    resp = @client.send(req)
    expect(resp['type']).to eq 'int'
    req = described_class.new('str_property')
    resp = @client.send(req)
    expect(resp['type']).to eq 'string'
  end

end

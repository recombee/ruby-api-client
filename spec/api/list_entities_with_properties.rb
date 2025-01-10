#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'list entities with properties' do
include_context 'set environment'

  it 'lists entities' do
    req = described_class.new()
    resp = @client.send(req)
    expect(resp).to eq ['entity_id']
  end

  it 'return properties' do
    req = described_class.new({'returnProperties' => true})
    resp = @client.send(req)
    expect(resp.size).to eq 1
  end

end

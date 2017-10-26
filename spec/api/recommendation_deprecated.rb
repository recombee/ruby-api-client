#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'recommendation deprecated' do
include_context 'set environment'
include_context 'set recomm entities'

  it 'recommends' do
    req = described_class.new('entity_id',9)
    resp = @client.send(req)
    expect(resp.size).to eq 9
  end

  it 'recommends to previously nonexisting entity with cascadeCreate' do
    req = described_class.new('nonexisting',9,{'cascadeCreate' => true})
    resp = @client.send(req)
    expect(resp.size).to eq 9
  end

  it 'recommends with expert settings' do
    req = described_class.new('nonexisting2',9,{'cascadeCreate' => true,'expertSettings' => {}})
    resp = @client.send(req)
    expect(resp.size).to eq 9
  end

end

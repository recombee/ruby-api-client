#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'recommendation' do
  include_context 'set environment'
  include_context 'set recomm entities'

  it 'recommends' do
    req = described_class.new('entity_id', 9)
    @client.send(req)
  end

  it 'recommends to previously nonexisting entity with cascadeCreate' do
    req = described_class.new('nonexisting', 9, { 'cascadeCreate' => true })
    @client.send(req)
  end

  it 'recommends with expert settings' do
    req = described_class.new('nonexisting2', 9, { 'cascadeCreate' => true, 'expertSettings' => {} })
    @client.send(req)
  end

  it 'recommends with reql expressions' do
    req = described_class.new('nonexisting2', 9,
                              { 'cascadeCreate' => true, 'reqlExpressions' => { 'boolean' => 'true', 'number' => 'if (\'answer\' > 0) then 1 else 2', 'string' => '"test"' } })
    @client.send(req)
  end
end

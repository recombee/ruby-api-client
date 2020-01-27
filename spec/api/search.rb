#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'search' do
include_context 'set environment'
include_context 'set recomm entities'

  it 'finds "hello"' do
    req = described_class.new('entity_id','hell',9)
    resp = @client.send(req)
    expect(resp['recomms'].size).to eq 1
  end

  it 'does not find random string' do
    req = described_class.new('entity_id','sdhskldf',9)
    resp = @client.send(req)
    expect(resp['recomms'].size).to eq 0
  end

  it 'returnProperties' do
    req = described_class.new('entity_id','hell',9,{'returnProperties' => true})
    resp = @client.send(req)
    expect(resp['recomms'].size).to eq 1
  end

end

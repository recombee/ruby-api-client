#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'next items recommendation' do
include_context 'set environment'
include_context 'set recomm entities'

  it 'recommends' do
    req = RecommendItemsToUser.new('entity_id',3,{'returnProperties' => true})
    resp = @client.send(req)
    req = described_class.new(resp['recommId'],3)
    resp = @client.send(req)
    expect(resp['recomms'].size).to eq 3
    req = described_class.new(resp['recommId'],3)
    resp = @client.send(req)
    expect(resp['recomms'].size).to eq 3
  end

end

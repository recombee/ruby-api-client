#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'update manual reql segmentation' do
include_context 'set environment'

  it 'updates manual ReQL segmentation' do
    req = CreateManualReqlSegmentation.new('seg1','items',{'title' => 'Test Segmentation','description' => 'For test purposes'})
    resp = @client.send(req)
    req = described_class.new('seg1',{'title' => 'New title','description' => 'Updated'})
    resp = @client.send(req)
  end

end

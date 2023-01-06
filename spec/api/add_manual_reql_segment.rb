#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'add manual reql segment' do
include_context 'set environment'

  it 'adds manual ReQL segment' do
    req = CreateManualReqlSegmentation.new('seg1','items',{'title' => 'Test Segmentation','description' => 'For test purposes'})
    resp = @client.send(req)
    req = described_class.new('seg1','first-segment','\'str_property\' != null',{'title' => 'First Segment'})
    resp = @client.send(req)
  end

end

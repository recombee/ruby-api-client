#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'delete manual reql segment' do
include_context 'set environment'

  it 'deletes manual ReQL segment' do
    req = CreateManualReqlSegmentation.new('seg1','items',{'title' => 'Test Segmentation','description' => 'For test purposes'})
    resp = @client.send(req)
    req = AddManualReqlSegment.new('seg1','first-segment','\'str_property\' != null',{'title' => 'First Segment'})
    resp = @client.send(req)
    req = described_class.new('seg1','first-segment')
    resp = @client.send(req)
  end

end

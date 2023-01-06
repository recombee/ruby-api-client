#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'get segmentation' do
include_context 'set environment'

  it 'gets existing segmentation' do
    req = CreatePropertyBasedSegmentation.new('seg1','items','str_property')
    resp = @client.send(req)
    req = described_class.new('seg1')
    resp = @client.send(req)
    expect(resp['segmentationId']).to eq 'seg1'
  end

end

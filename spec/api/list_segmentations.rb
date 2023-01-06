#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'list segmentations' do
include_context 'set environment'

  it 'lists existing segmentations' do
    req = CreatePropertyBasedSegmentation.new('seg1','items','str_property')
    resp = @client.send(req)
    req = described_class.new('items')
    resp = @client.send(req)
    expect(resp['segmentations'].size).to eq 1
  end

end

#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'update property based segmentation' do
include_context 'set environment'

  it 'updates property based segmentation' do
    req = CreatePropertyBasedSegmentation.new('seg1','items','str_property')
    resp = @client.send(req)
    req = described_class.new('seg1',{'title' => 'New title','propertyName' => 'str_property','description' => 'Updated'})
    resp = @client.send(req)
  end

end

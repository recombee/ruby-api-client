#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'update auto reql segmentation' do
include_context 'set environment'

  it 'updates auto ReQL segmentation' do
    req = CreateAutoReqlSegmentation.new('seg1','items','{\'str_property\'}',{'title' => 'Test Segmentation','description' => 'For test purposes'})
    resp = @client.send(req)
    req = described_class.new('seg1',{'title' => 'New title','expression' => '{\'str_property\' + \'str_property\'}','description' => 'Updated'})
    resp = @client.send(req)
  end

end

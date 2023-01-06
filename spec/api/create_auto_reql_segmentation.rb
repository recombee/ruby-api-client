#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'create auto reql segmentation' do
include_context 'set environment'

  it 'creates auto ReQL segmentation' do
    req = described_class.new('seg1','items','{\'str_property\'}',{'title' => 'Test Segmentation','description' => 'For test purposes'})
    resp = @client.send(req)
    req = described_class.new('seg1','items','{\'str_property\'}',{'title' => 'Test Segmentation','description' => 'For test purposes'})
    expect { @client.send(req) }.to raise_exception { |exception|
       expect(exception).to be_a(RecombeeApiClient::ResponseError)
       expect(exception.status_code).to eq 409
     }
  end

end

#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'delete segmentation' do
include_context 'set environment'

  it 'deletes segmentation' do
    req = CreatePropertyBasedSegmentation.new('seg1','items','str_property')
    resp = @client.send(req)
    req = described_class.new('seg1')
    resp = @client.send(req)
    req = described_class.new('seg1')
    expect { @client.send(req) }.to raise_exception { |exception|
       expect(exception).to be_a(RecombeeApiClient::ResponseError)
       expect(exception.status_code).to eq 404
     }
  end

end

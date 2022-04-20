#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'update more items' do
include_context 'set environment'

  it 'updates more items' do
    req = described_class.new('\'int_property\' == 42',{'int_property' => 77})
    resp = @client.send(req)
    expect(resp['itemIds'].size).to eq 1
    expect(resp['count']).to eq 1
  end

end

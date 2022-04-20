#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'delete more items' do
include_context 'set environment'

  it 'deletes more items' do
    req = described_class.new('\'int_property\' == 42')
    resp = @client.send(req)
    expect(resp['itemIds'].size).to eq 1
    expect(resp['count']).to eq 1
  end

end

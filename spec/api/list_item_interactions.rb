#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'list item interactions' do
include_context 'set environment'
include_context 'set interactions'

  it 'lists interactions' do
    req = described_class.new('item')
    resp = @client.send(req)
    expect(resp.size).to eq 1
    expect(resp[0]['itemId']).to eq 'item'
    expect(resp[0]['userId']).to eq 'user'
  end

end

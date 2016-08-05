#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'list set items' do
include_context 'set environment'

  it 'lists set items' do
    req = described_class.new('entity_id')
    resp = @client.send(req)
    expect(resp.size).to eq 1
    expect(resp[0]['itemId']).to eq 'entity_id'
    expect(resp[0]['itemType']).to eq 'item'
  end

end

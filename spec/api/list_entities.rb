require 'spec_helper'
require_relative 'set_environment'

shared_examples 'list entities' do
  include_context 'set environment'

  it 'lists entities' do
    list_req = described_class.new
    expect(@client.send(list_req)).to match_array ['entity_id']
  end
end

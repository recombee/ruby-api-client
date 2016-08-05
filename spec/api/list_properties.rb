#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'list properties' do
include_context 'set environment'

  it 'lists properties' do
    req = described_class.new()
    resp = @client.send(req)
    expect(resp.size).to eq 2
  end

end

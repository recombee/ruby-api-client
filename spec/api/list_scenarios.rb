#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'list scenarios' do
include_context 'set environment'

  it 'lists scenarios' do
    req = described_class.new()
    resp = @client.send(req)
  end

end

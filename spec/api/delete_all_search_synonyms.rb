#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'delete all search synonyms' do
include_context 'set environment'

  it 'deletes all search synonyms' do
    req = described_class.new()
    resp = @client.send(req)
  end

end

#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'list search synonyms' do
include_context 'set environment'

  it 'lists search synonyms' do
    req = AddSearchSynonym.new('sci-fi','science fiction')
    resp = @client.send(req)
    req = described_class.new()
    resp = @client.send(req)
    expect(resp['synonyms'].size).to eq 1
    req = described_class.new({'count' => 10,'offset' => 1})
    resp = @client.send(req)
    expect(resp['synonyms'].size).to eq 0
  end

end

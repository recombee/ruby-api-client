#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'delete search synonym' do
include_context 'set environment'

  it 'deletes search synonym' do
    req = AddSearchSynonym.new('sci-fi','science fiction')
    resp = @client.send(req)
    req = described_class.new(resp['id'])
    resp = @client.send(req)
    req = described_class.new('a968271b-d666-4dfb-8a30-f459e564ba7b')
    expect { @client.send(req) }.to raise_exception { |exception|
       expect(exception).to be_a(RecombeeApiClient::ResponseError)
       expect(exception.status_code).to eq 404
     }
  end

end

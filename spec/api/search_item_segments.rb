#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'search item segments' do
include_context 'set environment'

  it 'rejects request to scenario which is not set up' do
    req = described_class.new('entity_id','query',5,{'scenario' => 'scenario1','cascadeCreate' => true})
    expect { @client.send(req) }.to raise_exception { |exception|
       expect(exception).to be_a(RecombeeApiClient::ResponseError)
       expect(exception.status_code).to eq 400
     }
  end

end

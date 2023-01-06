#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'recommend item segments to item segment' do
include_context 'set environment'

  it 'rejects request to scenario which is not set up' do
    req = described_class.new('segment_id','entity_id',5,{'scenario' => 'scenario1','cascadeCreate' => true})
    expect { @client.send(req) }.to raise_exception { |exception|
       expect(exception).to be_a(RecombeeApiClient::ResponseError)
       expect(exception.status_code).to eq 400
     }
  end

end

#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'add search synonym' do
include_context 'set environment'

  it 'adds search synonym' do
    req = described_class.new('sci-fi','science fiction',{'oneWay' => true})
    resp = @client.send(req)
    expect(resp['term']).to eq 'sci-fi'
    expect(resp['synonym']).to eq 'science fiction'
    req = described_class.new('sci-fi','science fiction',{'oneWay' => true})
    expect { @client.send(req) }.to raise_exception { |exception|
       expect(exception).to be_a(RecombeeApiClient::ResponseError)
       expect(exception.status_code).to eq 409
     }
  end

end

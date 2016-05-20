require 'spec_helper'
require_relative 'set_environment'

shared_examples 'set values' do
  include_context 'set environment'

  it 'does not fail with existing entity and property' do
    req = described_class.new('entity_id','int_property' => 5)
    expect { @client.send(req) }.not_to raise_exception
  end

  it 'sets multiple properties' do
    req = described_class.new('entity_id',
      {'int_property' => 5,
       'str_property' => 'test'
      })
    expect { @client.send(req) }.not_to raise_exception
  end

  it 'does not fail with !cascadeCreate' do
    req = described_class.new('new_entity',
      {'int_property' => 5,
       'str_property' => 'test',
       '!cascadeCreate' => true
      })
    expect { @client.send(req) }.not_to raise_exception
  end

  it 'fails with nonexisting entity' do
    req = described_class.new('nonexisting','int_property' => 5)
    expect { @client.send(req) }.to raise_exception { |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 404
    }
  end
end

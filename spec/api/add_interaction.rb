#
# This file is auto-generated, do not edit
#

require 'spec_helper'
require_relative 'set_environment'
shared_examples 'add interaction' do
  include_context 'set environment'

  it 'does not fail with cascadeCreate' do
    req = described_class.new('u_id', 'i_id', { 'cascadeCreate' => true, 'additionalData' => { 'answer' => 42 } })
    @client.send(req)
  end

  it 'does not fail with existing item and user' do
    req = described_class.new('entity_id', 'entity_id')
    @client.send(req)
  end

  it 'does not fail with valid timestamp' do
    req = described_class.new('entity_id', 'entity_id', { 'timestamp' => '2013-10-29T09:38:41.341Z' })
    @client.send(req)
  end

  it 'fails with nonexisting item id' do
    req = described_class.new('entity_id', 'nonex_id')
    expect { @client.send(req) }.to(raise_exception do |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 404
    end)
  end

  it 'fails with nonexisting user id' do
    req = described_class.new('nonex_id', 'entity_id')
    expect { @client.send(req) }.to(raise_exception do |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 404
    end)
  end

  it 'really stores interaction to the system' do
    req = described_class.new('u_id2', 'i_id2', { 'cascadeCreate' => true, 'timestamp' => 5 })
    @client.send(req)
    expect { @client.send(req) }.to(raise_exception do |exception|
      expect(exception).to be_a(RecombeeApiClient::ResponseError)
      expect(exception.status_code).to eq 409
    end)
  end
end

require 'spec_helper'
require 'json'

describe Chimper::Client do
  before(:all) do
    Chimper.configure do |c|
      c.api_key = ChimperTestHelper.dummy_api_key
    end
  end

  let(:data) { ChimperTestHelper }
  let(:client) { described_class.new }

  def stub_client_request(uri, data)
    RequestStub.new(self).stub_client_request(uri, data)
  end

  describe '#request' do
    it 'should return request' do
      result = client.request.to_s
      expect(result).to eq('Gibbon::Request')
    end
  end

  describe '#respond_to?' do
    it 'returns true for method implemented in Gibbon::Request' do
      expect(client.respond_to?(:api_key)).to eq(true)
    end

    it 'returns false for unimplemented methods' do
      expect(client.respond_to?(:non_existing_method)).to eq(false)
    end
  end

  describe 'remote requests' do
    describe '#lists!' do
      it 'returns correct value' do
        stub_client_request('/lists', data.lists)
        result = client.lists!
        expect(result).to eq(Chimper::AwesomeStruct.new(data.lists))
      end
    end

    describe '#list!' do
      it 'returns correct value' do
        stub_client_request('/lists/id', data.list)
        result = client.lists!('id')
        expect(result).to eq(Chimper::AwesomeStruct.new(data.list))
      end
    end

    describe '#members!' do
      it 'returns correct value' do
        stub_client_request('/lists/id/members', data.members)
        result = client.lists('id').members!
        expect(result).to eq(Chimper::AwesomeStruct.new(data.members))
      end
    end

    describe '#member!' do
      it 'returns correct value' do
        stub_client_request('/lists/id/members/id', data.member)
        result = client.lists('id').members!('id')
        expect(result).to eq(Chimper::AwesomeStruct.new(data.member))
      end
    end
  end
end

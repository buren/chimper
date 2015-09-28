require 'spec_helper'

describe Chimper::Configuration do
  let(:config) { described_class.new }

  describe '#timeout' do
    it 'can hold timeout value' do
      config.timeout = 15
      expect(config.timeout).to eq(15)
    end
  end

  describe '#api_key' do
    it 'can hold api_key value' do
      config.api_key = 'key'
      expect(config.api_key).to eq('key')
    end

    it 'raises error if api_key is not set' do
      c = described_class.new
      expect { c.api_key }.to raise_error(StandardError, 'API Key must be set!')
    end
  end
end

require 'spec_helper'

describe Chimper do
  let(:config_klass) { Chimper::Configuration }

  describe '#configuration' do
    it 'can return configuration' do
      expect(described_class.configuration).to be_a(config_klass)
    end
  end

  describe '#reset!' do
    it 'can reset configuration' do
      c0 = described_class.configuration
      described_class.reset!
      c1 = described_class.configuration
      expect(c0).to_not eq(c1)
    end
  end

  describe '#configure' do
    it 'yields configuration to block' do
      described_class.configure do |c|
        expect(c).to be_a(config_klass)
      end
    end
  end
end

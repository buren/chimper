require 'spec_helper'

describe Chimper::List do
  let(:list) { described_class.new(ChimperTestHelper.list) }

  describe '#id' do
    it 'returns correct value' do
      expect(list.id).to eq('id')
    end
  end

  describe '#name' do
    it 'returns correct value' do
      expect(list.name).to eq('name')
    end
  end

  describe '#list_rating' do
    it 'returns correct value' do
      expect(list.list_rating).to eq(3)
    end
  end

  describe '#stats' do
    it 'returns correct #member_count' do
      expect(list.stats.member_count).to eq(229)
    end
  end
end

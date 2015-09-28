require 'spec_helper'

describe Chimper::Lists do
  let(:lists) { described_class.new(ChimperTestHelper.lists) }
  let(:list_klass) { Chimper::List }

  describe '#total_items' do
    it 'returns correct value' do
      expect(lists.total_items).to eq(2)
    end
  end

  describe '#each' do
    it 'wraps each list in a list class' do
      lists.each { |list| expect(list).to be_a(list_klass) }
    end
  end

  describe '#lists' do
    it 'returns lists' do
      expect(lists.lists.length).to eq(2)
    end
  end
end

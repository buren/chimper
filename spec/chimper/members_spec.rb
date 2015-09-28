require 'spec_helper'

describe Chimper::Members do
  let(:members) { described_class.new(ChimperTestHelper.members) }
  let(:member_klass) { Chimper::Member }

  describe '#each' do
    it 'wraps each member in a member class' do
      members.each { |member| expect(member).to be_a(member_klass) }
    end
  end

  describe '#total_items' do
    it 'returns correct value' do
      expect(members.total_items).to eq(1)
    end
  end

  describe '#members' do
    it 'returns members' do
      expect(members.members.length).to eq(1)
    end
  end
end

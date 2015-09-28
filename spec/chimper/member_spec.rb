require 'spec_helper'

describe Chimper::Member do
  let(:member) { described_class.new(ChimperTestHelper.member) }

  describe '#bounced?' do
    it 'returns correct value' do
      expect(member.bounced?).to eq(true)
    end
  end

  describe '#id' do
    it 'returns correct value' do
      expect(member.id).to eq('id')
    end
  end

  describe '#email' do
    it 'returns correct value' do
      expect(member.email).to eq('someone@example.com')
    end
  end

  describe '#status' do
    it 'returns correct value' do
      expect(member.status).to eq('cleaned')
    end
  end

  describe '#first_name' do
    it 'returns correct value' do
      expect(member.first_name).to eq('First')
    end
  end

  describe '#last_name' do
    it 'returns correct value' do
      expect(member.last_name).to eq('Last')
    end
  end

  describe '#member_rating' do
    it 'returns correct value' do
      expect(member.member_rating).to eq(3)
    end
  end

  describe '#list_id' do
    it 'returns correct value' do
      expect(member.list_id).to eq('list-id')
    end
  end

  describe '#stats' do
    it 'returns correct avg_open_rate' do
      expect(member.stats.avg_open_rate).to eq(1)
    end
  end

  describe '#location' do
    it 'returns correct value latitude' do
      expect(member.location.latitude).to eq(56.869)
    end
  end
end

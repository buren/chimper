require 'spec_helper'

describe Chimper::AwesomeStruct do
  it 'should return value' do
    subject = described_class.new(key: 'value')
    expect(subject.key).to eq('value')
  end

  it 'raises when there\'s no such key' do
    subject = described_class.new(key: 'value')
    expect { subject.non_existing_key }.to raise_error(NoMethodError)
  end

  it 'should be recursive' do
    subject = described_class.new('one' => { two: { three: 'four' } })
    expect(subject.one.two.three).to eq('four')
  end

  describe '#wrap_map on returned arrays' do
    it 'wraps each Hash in AwesomeStruct and yields to block' do
      subject = described_class.new(test: [{a: 1}])
      subject.test.wrap_map do |o|
        expect(o.a).to eq(1)
      end
    end

    it 'wraps each Hash in AwesomeStruct without block' do
      subject = described_class.new(test: [{a: 1}])
      expect(subject.test.wrap_map.first.a).to eq(1)
    end

    it 'does *not* wrap regular objects in AwesomeStruct' do
      subject = described_class.new(test: [1])
      subject.test.wrap_map do |o|
        expect(o).to eq(1)
      end
    end
  end
end

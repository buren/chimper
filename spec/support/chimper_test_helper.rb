require 'json'

class ChimperTestHelper
  def self.dummy_api_key
    '8066f0ac893cd5ae238b956d66f40e7e-us9'
  end

  def self.parse_test_json(filename)
    JSON.parse(File.read("spec/support/json/#{filename}.json"))
  end

  def self.list
    parse_test_json('list')
  end

  def self.lists(count = 2)
    parse_test_json('lists')
  end

  def self.member
    parse_test_json('member')
  end

  def self.members(count = 2)
    arr = []
    count.times { arr << member }
    {
      'members' => arr,
      'list_id' => arr.first['list_id'],
      'total_items' => arr.size
    }
    parse_test_json('members')
  end
end

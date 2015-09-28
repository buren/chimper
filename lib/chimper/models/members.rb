module Chimper
  class Members < BaseModel
    include Enumerable

    def initialize(data)
      @data = AwesomeStruct.new(
        members:     data['members'],
        list_id:     data['member_id'],
        total_items: data['total_items']
      )
    end

    def each(&block)
      @data.members.each { |member| block.call(Member.new(member)) }
    end
  end
end

module Chimper
  class Lists < BaseModel
    include Enumerable

    def initialize(data)
      @data = AwesomeStruct.new(
        lists:       data['lists'],
        total_items: data['total_items']
      )
    end

    def each(&block)
      @data.lists.each { |list| block.call(List.new(list)) }
    end
  end
end

module Chimper
  class List < BaseModel
    def initialize(data)
      @data = AwesomeStruct.new(data)
    end
  end
end

module Chimper
  class BaseModel
    attr_reader :data

    def method_missing(method, *args, &block)
      data.send(method, *args, &block)
    end
  end
end

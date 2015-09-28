# Based on: https://gist.github.com/henrik/5098550
module Chimper
  class AwesomeStruct
    include Comparable

    def initialize(hash)
      @hash = Hash[hash.map { |(key, value)| [key.to_sym, value] }]
    end

    def method_missing(name, *)
      value = fetch(name)
      decorate(value)
    end

    def <=>(other)
      return false unless other.is_a?(self.class)
      # Consider them equal if there based in the same hash
      to_h <=> other.to_h
    end

    def to_h
      @hash
    end

    private

    def fetch(name)
      @hash.fetch(name) do
        fail(NoMethodError, "undefined method `#{name}' for #{self}")
      end
    end

    def decorate(value)
      return self.class.new(value) if value.is_a?(Hash)
      define_map_wrap(value) if value.is_a?(Array)
      value
    end

    def define_map_wrap(array)
      klass = self.class
      convert_proc = ->(v) { (v.is_a?(Hash) ? klass.new(v) : v) }

      # Define #map_wrap method on array
      array.define_singleton_method(:wrap_map) do |&block|
        self.map do |v|
          value = convert_proc.call(v)
          block.nil? ? value : block.call(value)
        end
      end
    end
  end
end

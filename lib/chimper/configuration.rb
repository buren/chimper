module Chimper
  class Configuration
    attr_accessor :api_key, :timeout

    def initialize
      @timeout = 15
    end

    def api_key
      @api_key || fail(StandardError, 'API Key must be set!')
    end
  end
end

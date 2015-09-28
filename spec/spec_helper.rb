$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

if ENV.fetch('COVERAGE', false)
  require 'simplecov'
  SimpleCov.start 'rails'
end

require 'chimper'

# Test helper
require_relative 'support/chimper_test_helper'
require_relative 'support/request_stub'

require 'webmock/rspec'

# http://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
    mocks.verify_partial_doubles = true
  end

  config.order = :random
end

WebMock.disable_net_connect!

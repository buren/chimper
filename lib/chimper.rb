require 'chimper/version'
# Models
require 'chimper/models/awesome_struct'
require 'chimper/models/base_model'
# Lists
require 'chimper/models/lists'
require 'chimper/models/list'
# Members
require 'chimper/models/member'
require 'chimper/models/members'

# Public API
require 'chimper/client'
require 'chimper/configuration'

module Chimper
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset!
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end

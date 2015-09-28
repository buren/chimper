require 'gibbon'

module Chimper
  class Client
    attr_reader :request

    Request = ::Gibbon::Request

    def initialize
      config = Chimper.configuration
      Request.api_key = config.api_key
      Request.timeout = config.timeout
      @request = Request
      @builder = nil
    end

    # Allow calling defined methods with a ! afterwards to retrieve the data
    # If no method found here, delegate the call to the request object
    def method_missing(meth, *args, &block)
      response = dispatch_method(meth, *args, &block)
      # If the method ends with a '!' perform the request
      if meth.to_s.end_with?('!')
        wrap(@builder.retrieve).tap { @builder = nil } # Reset the builder after retrieve
      else
        # Keep building the path
        self
      end
    end

    def dispatch_method(meth, *args, &block)
      @builder ||= request # If no builder active, start from scratch
      method = meth.to_s.gsub('!', '') # Ignore ! at the end when delegating to Gibbon::Request
      @builder = @builder.public_send(method, *args, &block) # Store the intermediate response
    end

    def respond_to?(method, include_private = false)
      super || request.respond_to?(method)
    end

    private

    def wrap(response)
      AwesomeStruct.new(response)
    end
  end
end

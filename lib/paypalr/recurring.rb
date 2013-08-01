require "net/https"
require "cgi"
require "uri"
require "ostruct"
require "time"

module PayPalr
  module Recurring
    autoload :Base, "PayPalr/recurring/base"
    autoload :Notification, "PayPalr/recurring/notification"
    autoload :Request, "PayPalr/recurring/request"
    autoload :Response, "PayPalr/recurring/response"
    autoload :Version, "PayPalr/recurring/version"
    autoload :Utils, "PayPalr/recurring/utils"

    ENDPOINTS = {
       :sandbox => {
         :api  => "https://api-3t.sandbox.paypal.com/nvp",
         :site => "https://www.sandbox.paypal.com/cgi-bin/webscr"
       },
       :production => {
         :api  => "https://api-3t.paypal.com/nvp",
         :site => "https://www.paypal.com/cgi-bin/webscr"
       }
    }

    class << self
      # Define if requests should be made to PayPalr's
      # sandbox environment. This is specially useful when running
      # on development or test mode.
      #
      #   PayPalr::Recurring.sandbox = true
      #
      attr_accessor :sandbox

      # Set PayPalr's API username.
      #
      attr_accessor :username

      # Set PayPalr's API password.
      #
      attr_accessor :password

      # Set PayPalr's API signature.
      #
      attr_accessor :signature

      # Set seller id. Will be used to verify IPN.
      #
      #
      attr_accessor :seller_id

      # The seller e-mail. Will be used to verify IPN.
      #
      attr_accessor :email
    end

    # Just a shortcut for <tt>PayPalr::Recurring::Base.new</tt>.
    #
    def self.new(options = {})
      Base.new(options)
    end

    # Configure PayPalr::Recurring options.
    #
    #   PayPalr::Recurring.configure do |config|
    #     config.sandbox = true
    #   end
    #
    def self.configure(&block)
      yield PayPalr::Recurring
    end

    # Detect if sandbox mode is enabled.
    #
    def self.sandbox?
      sandbox == true
    end

    # Return a name for current environment mode (sandbox or production).
    #
    def self.environment
      sandbox? ? :sandbox : :production
    end

    # Return URL endpoints for current environment.
    #
    def self.endpoints
      ENDPOINTS[environment]
    end

    # Return API endpoint based on current environment.
    #
    def self.api_endpoint
      endpoints[:api]
    end

    # Return PayPalr's API version.
    #
    def self.api_version
      "72.0"
    end

    # Return site endpoint based on current environment.
    #
    def self.site_endpoint
      endpoints[:site]
    end
  end
end

module PayPalr
  module Recurring
    module Response
      autoload :Base, "PayPalr/recurring/response/base"
      autoload :Checkout, "PayPalr/recurring/response/checkout"
      autoload :Details, "PayPalr/recurring/response/details"
      autoload :Payment, "PayPalr/recurring/response/payment"
      autoload :ManageProfile, "PayPalr/recurring/response/manage_profile"
      autoload :Profile, "PayPalr/recurring/response/profile"
      autoload :Refund,  "PayPalr/recurring/response/refund"

      RESPONDERS = {
        :checkout       => "Checkout",
        :details        => "Details",
        :payment        => "Payment",
        :profile        => "Profile",
        :create_profile => "ManageProfile",
        :manage_profile => "ManageProfile",
        :update_profile => "ManageProfile",
        :refund         => "Refund"
      }

      def self.process(method, response)
        response_class = PayPalr::Recurring::Response.const_get(RESPONDERS[method])
        response_class.new(response)
      end
    end
  end
end

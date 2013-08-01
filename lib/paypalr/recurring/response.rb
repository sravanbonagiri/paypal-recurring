module PayPalr
  module Recurring
    module Response
      autoload :Base, "paypalr/recurring/response/base"
      autoload :Checkout, "paypalr/recurring/response/checkout"
      autoload :Details, "paypalr/recurring/response/details"
      autoload :Payment, "paypalr/recurring/response/payment"
      autoload :ManageProfile, "paypalr/recurring/response/manage_profile"
      autoload :Profile, "paypalr/recurring/response/profile"
      autoload :Refund,  "paypalr/recurring/response/refund"

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

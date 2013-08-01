module PayPalr
  module Recurring
    module Response
      class Checkout < Base
        def checkout_url
          "#{PayPalr::Recurring.site_endpoint}?cmd=_express-checkout&token=#{token}&useraction=commit"
        end
      end
    end
  end
end

class Order < ActiveRecord::Base
  PAYMENT_TYPES = ["Paypal", "MasterCard", "Visa", "Amex", "Discover"]
end

class Order < ApplicationRecord

 belongs_to :customer
 has_many :order_details, dependent: :destroy



 enum payment_method: { credit_card: 0, transfer: 1 }
 enum status: { wait: 0, confirmation: 1, making: 2, preparation: 3, completion: 4}

 def subtotal
  product.with_tax_price * quantity
 end

end

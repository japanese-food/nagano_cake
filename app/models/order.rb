class Order < ApplicationRecord
 
 belongs_to :customer
 has_many :order_items
 enum payment_method: { credit_card: 0, transfer: 1 }
 enum status: { wait: 0, confirmation: 1, making: 2, preparation: 3, completion: 4}
end

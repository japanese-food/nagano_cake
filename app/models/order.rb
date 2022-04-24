class Order < ApplicationRecord
 enum payment_method: { credit_card: 0, transfer: 1 }
 enum status: { wait: 0, confirmation: 1, making: 2, preparation: 3, completion: 4}
end

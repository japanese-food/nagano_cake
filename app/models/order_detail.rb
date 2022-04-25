class OrderDetail < ApplicationRecord
    belongs_to :order
	belongs_to :product

    enum making_status: { cannot: 0, wait: 1, making: 2, completion: 3 }

end


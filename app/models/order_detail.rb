class OrderDetail < ApplicationRecord
  belongs_to :order
	belongs_to :product


	def subtotal
      product.with_tax_price * amount
  end
    enum making_status: { cannot: 0, wait: 1, making: 2, completion: 3 }
    
end


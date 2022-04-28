class CartItem < ApplicationRecord
     def subtotal
       product.with_tax_price * quantity
     end

     belongs_to :customer
     belongs_to :product
     
     validates :quantity, presence: true
end

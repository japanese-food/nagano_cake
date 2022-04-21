class Product < ApplicationRecord
   has_one_attached :image

    def  add_tax_price
    (self.price * 1.10).round
    end

    has_many :cart_items
end

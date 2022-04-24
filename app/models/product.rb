class Product < ApplicationRecord
   has_one_attached :image

  def with_tax_price
    (price * 1.1).floor
  end

    has_many :cart_items
end

class Product < ApplicationRecord
   has_one_attached :image

  def with_tax_price
    (price * 1.1).floor
  end

    has_many :cart_items, dependent: :destroy
    belongs_to :genre
    has_many :order_details
    
    def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no-image.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
    end


     def self.looks(search, word)
    if search == "perfect_match"
      @product = Product.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @product = Product.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @product = Product.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @product = Product.where("name LIKE?","%#{word}%")
    else
      @product = Product.all
    end
     end

end

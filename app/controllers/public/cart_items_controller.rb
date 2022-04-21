class Public::CartItemsController < ApplicationController
  def index
    @product =  Product.find_by(params[:product_id])
    @cart_items = current_customer.cart_items
    @total_price = 0
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path

  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end
end

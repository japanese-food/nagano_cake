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

  def destroy
   @cart_item = CartItem.find(params[:id])
  # @cart_item.customer_id = current_customer.id
  # @cart_item = current_customer.cart_item
  # CartItem.find_by(cart_item_id: params[:cart_item_id], customer_id: current_customer.id)
  # @cart_item.product_id = Product.find(params[:product_id])
   @cart_item.destroy
   redirect_to  request.referer
  end

  def destroy_all
    @cart_item = CartItem.destroy_all
    redirect_to  request.referer
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :quantity)
  end
end

class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = @customer.addresses
  end

  def check
     @order = Order.new(order_params)
     if params[:order][:address_number] == "1"
       @order.delivery_name = current_customer.sur_name
       @order.delivery_address = current_customer.address


     elsif params[:order][:address_number] == "2"
        @order.name = Address.find(params[:order][:registered]).name
        @order.address = Address.find(params[:order][:registered]).address

     elsif params[:order][:address_number] == "3"
         address_new = current_customer.addresses.new(address_params)
         if address_new.save
         else
           render :new
         end
     else
       redirect_to order_thanx_path
     end
       @cart_items = current_customer.cart_items
       @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

   def create
      @order = Order.new(order_params)
        if @order.save
    	  redirect_to order_log_path
    	else
    	  render :new
    	end
   end




  def index
     @order = current_customer.orders
  end

  def show
     @order = Order.find(params[:id])
     @order_details = @order.order_details
  end

  def thanx
  end





   private

  def order_params
    params.require(:order).permit(:post_code, :payment_method, :total_price, :delivery_post_code, :delivery_address, :delivery_name)
  end

  def address_params
   params.require(:order).permit(:name, :address)
  end

end

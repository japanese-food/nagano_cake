class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = @customer.addresses
  end

  def check
     @order = Order.new(order_params)
     @total_price = 0
     if params[:order][:address_number] == "1"
       @order.delivery_name = current_customer.sur_name
       @order.delivery_address = current_customer.address
       @order.delivery_post_code = current_customer.post_code


     elsif params[:order][:address_number] == "2"
        @order.delivery_name = Address.find_by(params[:order][:registered]).name
        @order.delivery_address = Address.find_by(params[:order][:registered]).address
        @order.delivery_post_code = Address.find_by(params[:order][:registered]).post_code

     elsif params[:order][:address_number] == "3"
         @order.customer_id = current_customer.id
         address_new = current_customer.addresses.new(address_params)
         address_new.save
     else
       redirect_to orders_check_path
     end
       @cart_items = current_customer.cart_items
  end

    def create
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id

      @order.save
  	  redirect_to orders_thanx_path
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
    params.require(:order).permit(:postage, :billing_amount, :status, :delivery_post_code, :payment_method, :delivery_address, :delivery_name)
  end

  def address_params
   params.require(:order).permit(:name, :address, :post_code)
  end

end

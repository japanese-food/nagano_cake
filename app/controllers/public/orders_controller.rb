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
       @order.delivery_name = current_customer.sur_name + current_customer.first_name
       @order.delivery_address = current_customer.address
       @order.delivery_post_code = current_customer.post_code


     elsif params[:order][:address_number] == "2"
        @address = Address.find(params[:order][:address_id])
        @order.delivery_name = @address.name
        @order.delivery_address = @address.address
        @order.delivery_post_code = @address.post_code

     elsif params[:order][:address_number] == "3"
         @order.customer_id = current_customer.id
         address_new = current_customer.addresses.new
         address_new.save(address_params)
     else
       redirect_to orders_check_path
     end
       @cart_items = current_customer.cart_items
  end

    def create
      @order = Order.new(order_params)
      @order.customer_id = current_customer.id
      @order.status = 0
      @order.save

  	  @cart_items = current_customer.cart_items

  	  @cart_items.each do |cart_item|
  	    order_detail = OrderDetail.new
  	    order_detail.product_id = cart_item.product_id
  	    order_detail.price = cart_item.product.price
  	    order_detail.amount = cart_item.quantity
  	    order_detail.order_id = @order.id
  	    order_detail.making_status = 1
  	    order_detail.save
      end
      @cart_items.destroy_all
  	  redirect_to orders_thanx_path
    end


  def index
     @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @order_price = 0
    @total_price = 0
  end

  def thanx
  end





   private

  def order_params
    params.require(:order).permit(:postage, :billing_amount, :status, :delivery_post_code, :payment_method, :delivery_address, :delivery_name, :making_status)
  end

  def address_params
   params.require(:order).permit(:name, :address, :post_code)
  end

end

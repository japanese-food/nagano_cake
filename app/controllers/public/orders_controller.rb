class Public::OrdersController < ApplicationController

  def index
     @order = current_customer.orders
  end

  def show
     @order = Order.find(params[:id])
     @order_details = @order.order_details
  end

  def thanx
  end

  def new
    @order = Order.new
    @customer = current_customer
  end

  def log
     @order = Order.new(order_params)
     if params[:order][:address_number] == "1"
       @order.name = current_customer.name
       @order.address = current_customer.customer_address
       
     elsif params[:order][:address_number] == "2"
        if Address.exists?(name: params[:order][:registered])
            @order.name = Address.find(params[:order][:registered]).name
            @order.address = Address.find(params[:order][:registered]).address
        else
          render :new
        end
        
     elsif params[:order][:address_number] == "3"
         address_new = current_customer.addresses.new(address_params)
         if address_new.save 
         else
           render :new
         end
     else
       redirect_to order_thanx_path
     end
       @cart_items = current_customer.cart_items.all
       @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
  end
  
  def create
      @order = current_customer.orders.new(order_params)
          if @order.save
    			redirect_to order_log_path(@order)
    	  else
    			render :new
    	  end
  
  end

  
  
   private

  def order_params
    params.require(:order).permit(:post_code, :address, :name, :payment_method, :total_price)
  end
  
  def address_params
   params.require(:order).permit(:name, :address)
  end

end

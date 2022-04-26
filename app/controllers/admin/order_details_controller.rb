class Admin::OrderDetailsController < ApplicationController


  def update
     @order = Order.find(params[:id])
     @order_details = @order.order_details
     @order_details.update(order_detail_params)
    # @order.update(order_params)
       redirect_to admin_order_path(@order)
  end


   private

	def order_detail_params
		  params.require(:order_detail).permit(:product_id, :making_status, :price, :amount)
	end

# 	def order_params
	 #params.require(:order).permit(:postage, :billing_amount, :status, :delivery_post_code, :payment_method, :delivery_address, :delivery_name)
  # end
end

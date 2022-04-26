class Admin::OrderDetailsController < ApplicationController


  def update
     @order_details = OrderDetail.find_by(params[:making_status])
     @order_details.update(order_detail_params)
     order = Order.find(params[:id])
       redirect_to admin_order_path(order)
  end


   private

	def order_detail_params
		  params.require(:order_detail).permit(:order_id, :making_status)
	end

end

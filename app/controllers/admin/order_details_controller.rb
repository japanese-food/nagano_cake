class Admin::OrderDetailsController < ApplicationController


  def update
    @order_details = OrderDetail.find(params[:id])
    @order_details.update(order_detail_params)
    redirect_to request.referer
  end


   private

	def order_detail_params
		  params.require(:order_detail).permit(:product_id, :making_status, :price, :amount)
	end

end
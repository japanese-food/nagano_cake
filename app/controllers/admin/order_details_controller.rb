class Admin::OrderDetailsController < ApplicationController


  def update
    @order = Order.find(params[:order_id])
    @order_detail = @order.order_details.find(params[:id])
    if @order_detail.update(order_detail_params)
     if @order_detail.making_status == "making"
        @order.status = "making"
        @order.save
     end
    end
    redirect_to request.referer
  end


   private

	def order_detail_params
		  params.require(:order_detail).permit(:order_id, :product_id, :making_status, :price, :amount)
	end

	def order_params
	    params.require(:order).permit(:status)
  end
end

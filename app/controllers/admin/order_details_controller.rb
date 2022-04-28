class Admin::OrderDetailsController < ApplicationController


  def update
    @order_details = OrderDetail.find(params[:id])
    @order = @order_details.order
    @order_detail = @order.order_details.find(params[:id])
    if @order_detail.update(order_detail_params)
     if @order_detail.making_status == "making"
        @order.status = "making"
        @order.save
  
     else @order.order_details.count == @order.order_details.where(making_status: "completion").count
        @order.update(status: "preparation")
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

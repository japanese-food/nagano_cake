class Admin::OrderDetailsController < ApplicationController


  def update
    @order_details = OrderDetail.find(params[:id])
    @order = @order_details.order
    @order_details.update(order_detail_params)
    if @order.order_details.count == @order.order_details.where(making_status: "completion").count
    @order.update(status: "preparation")
    end
    redirect_to request.referer
  end


   private

	def order_detail_params
		  params.require(:order_detail).permit(:product_id, :making_status, :price, :amount)
	end

end

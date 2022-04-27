class Admin::OrderDetailsController < ApplicationController


  def update
    @order_details = OrderDetail.find(params[:id])
    @order_details.update(order_detail_params)
    if params[:order_detail][:making_status] == "completion"
       @order = Order.find_by(params[:order_detail][:order_id])
       @order.status = "preparation"
       @order.save
    end
    redirect_to request.referer
  end


   private

	def order_detail_params
		  params.require(:order_detail).permit(:order_id, :product_id, :making_status, :price, :amount)
	end

end

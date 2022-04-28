class Admin::OrdersController < ApplicationController


  def index
     @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total_price = 0
  end

  def update
    @order = Order.find(params[:id])
     if @order.update(order_params)#@order...複数の注文商品が入金→制作ステータス
       if params[:order][:status] == "confirmation"
          @order.order_details.each do |order_detail|
            order_detail.making_status = "wait"
            order_detail.save
          end
       end
       redirect_to admin_order_path(@order)
     else
      render :show
     end
  end


  private
	def order_params
		  params.require(:order).permit(:status)
	end

end

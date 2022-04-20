class Public::CustomersController < ApplicationController

  

  def show
    @customer = current_customer
  end

  def edit
  end


  private
  def customer_params
    params.require(:customer).permit(:email, :sur_name, :first_name, :sur_name_kana, :first_name_kana, :post_code, :address, :phone_number)
  end

end

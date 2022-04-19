class Admin::ProductsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @product_new = Product.new
  end

  def create
    @product_new = Product.new(product_params)
    @product_new.save
    redirect_to product_path(@product)
  end

  def edit
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :caption)
  end
end

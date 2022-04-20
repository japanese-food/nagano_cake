class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product_new = Product.new
  end

  def create
    @product_new = Product.new(product_params)
    @product_new.save
    redirect_to admin_product_path(@product_new)
  end

  def edit
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit(:image, :name, :caption)
  end
end

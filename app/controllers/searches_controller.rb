class SearchesController < ApplicationController
  def search
    @range = params[:range]

    if @range == "Product"
      @products = Product.looks(params[:search], params[:word])
    else
      @genres = Genre.looks(params[:search], params[:word])
    end
  end

end

class Public::HomesController < ApplicationController
  def top
    @products = Product.limit(4).order(Arel.sql(" created_at DESC "))
  end

  def about
  end
end

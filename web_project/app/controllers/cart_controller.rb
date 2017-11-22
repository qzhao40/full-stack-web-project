class CartController < ApplicationController
  def add_to_cart_success

  end
  def cart
    if params[:quantity] != session[:items_in_cart][params[:id]]
       session[:items_in_cart][params[:id]] =  params[:quantity].to_i
    end
  end
end

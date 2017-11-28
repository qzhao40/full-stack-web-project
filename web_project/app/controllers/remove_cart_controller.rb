class RemoveCartController < ApplicationController
  def remove_cart
    session[:items_in_cart].delete(params[:id])
    flash[:notice] = "Item removed from shopping cart"
    redirect_to "/cart/cart"
  end
end

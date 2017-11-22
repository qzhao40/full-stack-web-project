class PagesController < ApplicationController


  def index
    @products = Product.all
    # @products = Product.order("name").page(params[:page]).per(5)
    @order_item = current_order.order_items.new
  end

  def show
    @page = params[:page]
    render "pages/#{@page}"
  end
end

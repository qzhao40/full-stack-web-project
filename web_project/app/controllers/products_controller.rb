class ProductsController < ApplicationController
  def index
    @products = Product.all
    # @products = Product.order("name").page(params[:page]).per(5)
    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.find(pram[:id])
  end

  def search_results
    @products = Product.all
  end
end

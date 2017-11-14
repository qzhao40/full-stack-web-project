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
    wildcard_keywords = '%' + param[:search_keywords] + '%'
    @products = Product.where("name LIKE ?", wildcard_keywords)
  end
end

class ProductsController < ApplicationController
  before_action :initialize_session
  def index
    @products = Product.all.page(params[:page]).per(5)
    # @products = Product.order("name").page(params[:page]).per(5)
    @order_item = current_order.order_items.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def search
  end

  def search_results
    wildcard_keywords = '%' + params[:search_keywords] + '%'
    @products = Product.where("name LIKE ?", wildcard_keywords)
  end

  def add_to_cart

    id = params[:id].to_i
    session[:items_in_cart][id]=1
    #unless session[:items_in_cart].include?(id)
    flash[:notice] = "Item added to shopping cart"
    redirect_back(fallback_location: root_path)
  end
    private
  def initialize_session
    session[:items_in_cart] ||= Hash.new
  end
end

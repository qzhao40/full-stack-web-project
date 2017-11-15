class SearchController < ApplicationController
  def search_result
    category_id_param = params[:category_id]
    search_upper = params[:search].downcase
    if category_id_param != "Overall"
        @products = Category.find(category_id_param).products.where('lower(name) LIKE :q OR description LIKE :q', q: "%#{search_upper}%")
    else
        @products = Product.where('lower(name) LIKE :q OR description LIKE :q', q: "%#{search_upper}%")
    end

  end

  def search_show
  end
end

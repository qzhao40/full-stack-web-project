class Product < ActiveRecord::Base

  has_many :order_items
  has_many :product_status

  default_scope { where(active: true) }
end

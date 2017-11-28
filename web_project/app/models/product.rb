class Product < ActiveRecord::Base

  validates :name, :category,:price, presence: true
  validates :name, :description, length: {maximum: 500}
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  belongs_to :category
  belongs_to :location

  has_many :order_items
  has_many :product_status
  has_many :lineItem

  default_scope { where(active: true) }
  mount_uploader :image_filename, ImageUploader
end

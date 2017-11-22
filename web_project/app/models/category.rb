class Category < ApplicationRecord
  validates :name, presence: true
  validates :name, length: {maximum: 50}
  has_many :products

end

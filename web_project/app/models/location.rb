class Location < ApplicationRecord
  validates :name, :tax_rate, presence: true
  validates :name, length: {maximum: 50}
  has_many :products
  has_many :customer
end

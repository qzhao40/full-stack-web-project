class Status < ApplicationRecord
  validates :name, presence: true
  validates :name, length: {maximum: 50}
  has_many :orders
end

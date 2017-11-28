class LineItem < ApplicationRecord
  validates :product, :order, presence: true
  belongs_to :product
  belongs_to :order
end

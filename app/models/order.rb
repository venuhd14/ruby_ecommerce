class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :products, through: :order_items

  validates :total_price, numericality: { greater_than: 0 }

  # This callback will automatically set the total_price before saving the order
  before_save :calculate_total_price

  private

  def calculate_total_price
    self.total_price = products.sum(&:price)
  end
end

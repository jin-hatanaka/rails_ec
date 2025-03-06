class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy

  def total
    order_details.inject(0) { |sum, order_detail| sum + order_detail.subtotal }
  end
end

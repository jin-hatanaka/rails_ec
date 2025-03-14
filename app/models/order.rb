# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy

  def total
    if discount.nil?
      order_details.inject(0) { |sum, order_detail| sum + order_detail.subtotal }
    else
      order_details.inject(0) { |sum, order_detail| sum + order_detail.subtotal } - discount
    end
  end
end

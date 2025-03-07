# frozen_string_literal: true

class OrderDetail < ApplicationRecord
  belongs_to :order

  def subtotal
    price * quantity
  end
end

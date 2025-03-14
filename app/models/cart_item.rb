# frozen_string_literal: true

class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def subtotal
    product.price * quantity
  end
end

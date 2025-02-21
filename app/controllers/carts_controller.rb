# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :current_cart

  def index
    @cart_items = current_cart.cart_items
    @total = @cart_items.inject(0) { |sum, cart_item| sum + cart_item.subtotal }
  end
end

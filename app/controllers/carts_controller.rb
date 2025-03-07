# frozen_string_literal: true

class CartsController < ApplicationController
  def index
    @cart_items = @cart.cart_items
    @order = Order.new
  end
end

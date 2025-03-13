# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_promotion_code

  def index
    @cart_items = @cart.cart_items
    @order = Order.new
    @total = @cart.total
    if session[:promotion_code]
      @total -= @promotion_code.discount
    end
  end
end

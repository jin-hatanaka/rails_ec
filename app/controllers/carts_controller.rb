# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_cart

  def index
    @cart_items = set_cart.cart_items
  end
end

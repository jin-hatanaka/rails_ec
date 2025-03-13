# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_cart

  private

  def set_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end

  def set_promotion_code
    @promotion_code = PromotionCode.find_by(code: session[:promotion_code])
  end
end

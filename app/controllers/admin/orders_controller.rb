# frozen_string_literal: true

module Admin
  class OrdersController < ApplicationController
    before_action :basic_auth
    before_action :set_promotion_code

    def index
      @orders = Order.all
    end

    def show
      @order = Order.find(params[:id])
      @order_details = @order.order_details
    end

    def create
      @order = Order.new(order_params)
      ApplicationRecord.transaction do
        @order.save!
        @cart_items = @cart.cart_items
        @cart_items.each do |cart_item|
          create_order_details(cart_item)
        end
        @cart.destroy!
        @promotion_code.destroy!
        reset_session
      end
      OrderMailer.complete(@order).deliver_later
      redirect_to root_path, notice: 'ご購入ありがとうございます'
    end

    private

    def order_params
      params.require(:order).permit(:first_name, :last_name, :username, :email, :address1, :address2, :country,
                                    :state, :zip, :name_on_card, :credit_card_number, :expiration, :cvv).merge(discount: @promotion_code.discount)
    end

    def create_order_details(cart_item)
      @order.order_details.create!(product_name: cart_item.product.name, price: cart_item.product.price,
                                   quantity: cart_item.quantity)
    end

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end
  end
end

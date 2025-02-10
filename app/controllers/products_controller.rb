# frozen_string_literal: true

class ProductsController < ApplicationController
  def index
    @products = Product.with_attached_image
  end

  def show
    @product = Product.find(params[:id])
    @related_products = Product.order(created_at: :desc).with_attached_image
  end
end

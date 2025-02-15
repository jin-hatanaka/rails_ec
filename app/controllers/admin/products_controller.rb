# frozen_string_literal: true

module Admin
  class ProductsController < ApplicationController
    before_action :basic_auth
    before_action :set_product, only: %i[edit update destroy]

    def index
      @products = Product.all
    end

    def show; end

    def new
      @product = Product.new
    end

    def edit; end

    def update
      @product.update(product_params)
      redirect_to admin_products_path, notice: "商品「#{@product.name}」を更新しました。"
    end

    def create
      @product = Product.new(product_params)
      @product.save
      redirect_to admin_products_path, notice: "商品「#{@product.name}」を登録しました。"
    end

    def destroy
      @product.destroy
      redirect_to admin_products_path, notice: "商品「#{@product.name}」を削除しました。"
    end

    private

    def product_params
      params.require(:product).permit(:name, :price, :description, :image)
    end

    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
      end
    end

    def set_product
      @product = Product.find(params[:id])
    end
  end
end

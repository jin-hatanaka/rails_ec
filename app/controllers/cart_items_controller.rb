# frozen_string_literal: true

class CartItemsController < ApplicationController
  def create
    # セッションを持ったset_cartの中で送信されたproduct.idを持ったcart_itemsを変数@cart_item代入する、無ければ作成する
    @cart_item = @cart.cart_items.find_or_initialize_by(product_id: params[:product_id]) do |cart_item|
      cart_item.quantity = 0
    end

    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    redirect_to request.referer
  end

  def destroy
    @cart_item = @cart.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to request.referer, notice: "#{@cart_item.product.name} はショッピングカートから削除されました。"
  end
end

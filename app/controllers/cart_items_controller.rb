class CartItemsController < ApplicationController
  before_action :current_cart

  def create
    # セッションを持ったcurrent_cartの中で送信されたproduct.idを持ったcart_itemsを変数@cart_item代入する
    @cart_item = current_cart.cart_items.find_by(product_id: params[:product_id])

    if @cart_item.blank?
      @cart_item = current_cart.cart_items.build(product_id: params[:product_id], quantity: 0)
    end

    @cart_item.quantity += params[:quantity].to_i
    @cart_item.save
    redirect_to request.referer
  end

  def destroy
    @cart_item = current_cart.cart_items.find(params[:id])
    @cart_item.destroy
    redirect_to request.referer, notice: "#{@cart_item.product.name} はショッピングカートから削除されました。"
  end
end

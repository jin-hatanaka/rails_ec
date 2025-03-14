# frozen_string_literal: true

class PromotionCodesController < ApplicationController
  def create
    redirect_to request.referer, alert: '適用できるプロモーションコードは1つまでです。' and return if session[:promotion_code]
    redirect_to request.referer, alert: '無効なプロモーションコードです。' and return if PromotionCode.find_by(code: params[:code]).nil?
      session[:promotion_code] = PromotionCode.find_by(code: params[:code]).code
      redirect_to request.referer, notice: 'プロモーションコードが適用されました。'
  end
end

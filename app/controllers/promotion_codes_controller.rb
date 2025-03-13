class PromotionCodesController < ApplicationController
  def create
    if session[:promotion_code]
      redirect_to request.referer, alert: "適用できるプロモーションコードは1つまでです。"
    elsif PromotionCode.find_by(code: params[:code]) == nil
      redirect_to request.referer, alert: "無効なプロモーションコードです。"
    else
      session[:promotion_code] = PromotionCode.find_by(code: params[:code]).code
      redirect_to request.referer, notice: "プロモーションコードが適用されました。"
    end
  end
end
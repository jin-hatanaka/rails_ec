class OrderMailer < ApplicationMailer
  def complete(order)
    @order = order
    mail(
      subject: 'ご注文内容の確認',
      to: @order.email
    )
  end
end

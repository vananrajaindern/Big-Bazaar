class SalesMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sales_mailer.new_sales.subject
  #
  def new_sales(email,header,msg)
    @msg=msg

    mail to: email,
    subject: header
  end
end

class PaymentScheme < ApplicationMailer
  default from: "mike.jec.it@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.payment_scheme.bank_payment.subject
  #
  def bank_payment(user)
    @user = user

    attachments.inline['email_images/header.png'] = File.read("#{Rails.root}/app/assets/images/email_images/header.png")
    attachments.inline['email_images/line.png'] = File.read("#{Rails.root}/app/assets/images/email_images/line.png")
    attachments.inline['email_images/facebook.png'] = File.read("#{Rails.root}/app/assets/images/email_images/facebook.png")
    attachments.inline['email_images/web.png'] = File.read("#{Rails.root}/app/assets/images/email_images/web.png")
    mail to: @user.emailaddress, subject: "Nihongo Class Reservation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.payment_scheme.counter_payment.subject
  #
  def counter_payment(user)
    @user = user

    attachments.inline['email_images/header.png'] = File.read("#{Rails.root}/app/assets/images/email_images/header.png")
    attachments.inline['email_images/line.png'] = File.read("#{Rails.root}/app/assets/images/email_images/line.png")
    attachments.inline['email_images/facebook.png'] = File.read("#{Rails.root}/app/assets/images/email_images/facebook.png")
    attachments.inline['email_images/web.png'] = File.read("#{Rails.root}/app/assets/images/email_images/web.png")
    mail to: @user.emailaddress, subject: "Nihongo Class Reservation"
  end
end

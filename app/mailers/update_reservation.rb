class UpdateReservation < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.update_reservation.cebu_student.subject
  #
  def cebu_student(user,location,teacher)
    @user = user
    @cebu = location
    @teacher = teacher

    attachments.inline['email_images/header.png'] = File.read("#{Rails.root}/app/assets/images/email_images/header.png")
    attachments.inline['email_images/line.png'] = File.read("#{Rails.root}/app/assets/images/email_images/line.png")
    attachments.inline['email_images/facebook.png'] = File.read("#{Rails.root}/app/assets/images/email_images/facebook.png")
    attachments.inline['email_images/web.png'] = File.read("#{Rails.root}/app/assets/images/email_images/web.png")

    mail to: @user.emailaddress, subject: "Reserved | Nihongo Class Reservation"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.update_reservation.manila_student.subject
  #
  def manila_student(user,location,teacher)
    @user = user
    @manila = location
    @teacher = teacher

    attachments.inline['email_images/header.png'] = File.read("#{Rails.root}/app/assets/images/email_images/header.png")
    attachments.inline['email_images/line.png'] = File.read("#{Rails.root}/app/assets/images/email_images/line.png")
    attachments.inline['email_images/facebook.png'] = File.read("#{Rails.root}/app/assets/images/email_images/facebook.png")
    attachments.inline['email_images/web.png'] = File.read("#{Rails.root}/app/assets/images/email_images/web.png")

    mail to: @user.emailaddress, subject: "Reserved | Nihongo Class Reservation"
  end
end

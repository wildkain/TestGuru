class ContactUsMailer < ApplicationMailer



  def mailto_admin(letter)
    @admin_mail = ENV['ADMIN_MAIL']
    @message = letter[:message]
    mail to: Admin.first.email, from: letter[:email]
  end

end

class AdminMailer < ApplicationMailer

  def welcome_email(admin)
    @admin = admin
    @url  = 'http://example.com/login'
    mail(to: @admin.email, subject: 'Welcome Employee')
  end
end

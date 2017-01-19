class UserMailer < ApplicationMailer

  def welcome_email(user)
   @user = user
   @url  = 'http://example.com/login'
   mail(to: @user.email, subject: 'Welcome to Inspection King')
 end

 def job_claimed(user, job, admin)
   @user = user
   @job = job
   @admin = admin

   mail(to: @user.email, subject: 'Inspection Received')
 end

 def job_updated(user, job, admin, note)
   @user = user
   @job = job
   @admin = admin
   @note = note

   mail(to: @user.email, subject: 'Inspection Still Pending notes updated')
 end

 def job_approved(user, job, admin)
   @user = user
   @job = job
   @admin = admin

   mail(to: @user.email, subject: 'Inspection Approved')
 end

end

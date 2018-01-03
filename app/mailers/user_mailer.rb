class UserMailer < ApplicationMailer
  def invite(email)
    mail(to: email, subject: "You have been invited to use Appetype!")
  end
end

class UserMailer < ApplicationMailer
  def invite(user_invitation)
    @url = signup_url + "?token=#{user_invitation.token}"
    attachments.inline['logo.png'] = File.read("#{Rails.root}/public/images/logo.png")
    mail(to: user_invitation.email, subject: 'You have been invited to use Appetype!')
  end
end

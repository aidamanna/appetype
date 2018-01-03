# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def invite
    UserMailer.invite('aidamanna@gmail.com')
  end
end

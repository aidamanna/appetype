module Users
  class InviteCreator
    def call(email)
      user_invitation = UserInvitation.new_with_email(email)
      user_invitation.save

      UserMailer.invite(email).deliver
    end
  end
end

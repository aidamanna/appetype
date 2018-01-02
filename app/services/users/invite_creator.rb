module Users
  class InviteCreator
    def call(email)
      user_invitation = UserInvitation.new_with_email(email)
      user_invitation.save
    end
  end
end

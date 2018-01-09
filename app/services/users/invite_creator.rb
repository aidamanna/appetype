module Users
  class InviteCreator
    def call(email)
      raise Error::ExistingUser, 'The user already exists in the database' if User.find_by_email(email)

      user_invitation = user_invitation(email)
      UserMailer.invite(user_invitation).deliver
    end

    private

    def user_invitation(email)
      existing_user_invitation = UserInvitation.find_by_email(email)
      return existing_user_invitation if existing_user_invitation
      new_invitation(email)
    end

    def new_invitation(email)
      user_invitation = UserInvitation.new_with_email(email)
      unless user_invitation.save
        raise Error::DatabaseValidations.new(
          'The user invitation cannot be saved',
          user_invitation.errors.full_messages
        )
      end
      user_invitation
    end
  end
end

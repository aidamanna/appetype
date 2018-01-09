module Users
  class Creator
    def call(user_params)
      puts user_params
      user = User.new(user_params)
      unless user.save
        raise Error::DatabaseValidations.new(
          'The user cannot be saved',
          user.errors.full_messages
        )
      end

      user_invitation = UserInvitation.find_by_email(user_params[:email])
      user_invitation.accepted_at = Time.now
      unless user_invitation.save
        raise Error::DatabaseValidations.new(
          'The user invitation cannot be updated',
          user_invitation.errors.full_messages
        )
      end

      user.id
    end
  end
end

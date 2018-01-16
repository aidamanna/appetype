module Users
  class Creator
    InvitationNotFound = Class.new(StandardError)

    def call(user_params, token)
      user_invitation = UserInvitation.find_by(email: user_params[:email], token: token)
      raise InvitationNotFound, 'There is not an invitation token for the email' if user_invitation.nil?

      user = User.new(user_params)
      unless user.save
        raise Error::DatabaseValidations.new(
          'The user cannot be saved',
          user.errors.full_messages
        )
      end

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

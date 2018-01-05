module Users
  class InviteTokenValidator
    def call(token)
      raise Error::InvalidToken, 'The invitation token is missing' if token.nil?

      user_invitation = UserInvitation.find_by_token(token)
      raise Error::InvalidToken, 'The invitation token is not a valid token' if user_invitation.nil?
      raise Error::InvalidToken, 'The invitation has already been used' unless user_invitation.accepted_at.nil?

      User.new(email: user_invitation.email)
    end
  end
end

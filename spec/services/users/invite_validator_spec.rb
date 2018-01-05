describe Users::InviteTokenValidator do
  describe '#call' do
    it 'raises an error when the token is missing' do
      expect { Users::InviteTokenValidator.new.call(nil) }
        .to raise_error(Error::InvalidToken, 'The invitation token is missing')
    end

    it 'raises an error when the token is not valid' do
      allow(UserInvitation).to receive(:find_by_token).and_return(nil)

      expect { Users::InviteTokenValidator.new.call('aBcdEf') }
        .to raise_error(Error::InvalidToken, 'The invitation token is not a valid token')
    end

    it 'raises an error when the token has been used' do
      user_invitation = double(:user_invitation, accepted_at: '2017-06-01')
      allow(UserInvitation).to receive(:find_by_token).and_return(user_invitation)

      expect { Users::InviteTokenValidator.new.call('aBcdEf') }
        .to raise_error(Error::InvalidToken, 'The invitation has already been used')
    end

    it 'returns an invited user when a valid token' do
      user_invitation = double(:user_invitation, accepted_at: nil, email: 'maria@appetype.com')
      allow(UserInvitation).to receive(:find_by_token).and_return(user_invitation)
      expect(User).to receive(:new).with(email: user_invitation.email)

      Users::InviteTokenValidator.new.call('aBcdEf')
    end
  end
end

describe UserInvitation do
  describe 'Validations' do
    subject { described_class.new(token: 'aBCdeFg', email: 'emma@appetype.com') }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a token' do
      subject.token = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a user' do
      subject.email = nil
      expect(subject).not_to be_valid
    end
  end

  describe '.new_with_email' do
    it 'creates a user invitation with the specified email' do
      user_invitation = UserInvitation.new_with_email('emma@appetype.com')
      expect(user_invitation).to be_valid
    end
  end
end

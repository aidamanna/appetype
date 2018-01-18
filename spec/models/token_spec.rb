describe Token do
  subject { described_class.new(user_id: '1', oauth_token: 'aBCdeFg') }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a user' do
      subject.user_id = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a token' do
      subject.oauth_token = nil
      expect(subject).not_to be_valid
    end
  end
end

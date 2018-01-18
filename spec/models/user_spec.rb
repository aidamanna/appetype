describe User do
  subject { described_class.new(name: 'Emma', email: 'emma@appetype.com', password: 'emma') }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is invalid without a name' do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it 'is invalid with a name with less than 3 characters' do
      subject.name = 'Em'
      expect(subject).not_to be_valid
    end

    it 'is invalid with a name with more than 25 characters' do
      subject.name = 'Emma Maria Eugenia Maite E'
      expect(subject).not_to be_valid
    end

    it 'is invalid without an email' do
      subject.email = nil
      expect(subject).not_to be_valid
    end

    it 'is invalid if the email format is incorrect' do
      subject.email = 'a@b'
      expect(subject).not_to be_valid
    end

    it 'is invalid withoug a password' do
      subject.password = nil
      expect(subject).not_to be_valid
    end
  end

  describe '.role' do
    it 'should return true if the user has the specified role' do
      expect(subject.role?(:diner)).to eql(true)
    end

    it 'should return false if the user does not have the specified role' do
      expect(subject.role?(:admin)).to eql(false)
    end
  end
end

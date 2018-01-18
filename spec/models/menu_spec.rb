describe Menu do
  subject { described_class.new(week: '2018W04') }

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a week' do
      subject.week = nil
      expect(subject).not_to be_valid
    end
  end

  describe '#week_description' do
    it 'provides the week description' do
      expect(subject.week_description).to eql('January 22 to January 26')
    end
  end
end

describe Webhook do
  describe 'Validations' do
    subject do
      described_class.new(event_id: 'aBCdeFg',
                          event_type: 'form_response',
                          form_response: { fields: [] })
    end

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without an event id' do
      subject.event_id = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without an event type' do
      subject.event_type = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a from response' do
      subject.form_response = nil
      expect(subject).not_to be_valid
    end
  end
end

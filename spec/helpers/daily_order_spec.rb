describe DailyOrder do
  describe '#to_hash' do
    it 'fails when the ref does not have three parts' do
      expect { DailyOrder.from_ref('withoutthreeparts') }
        .to raise_error 'The ref does not have three parts: withoutthreeparts'
    end

    it 'returns a daily order' do
      choice_ref = DailyOrder.from_ref('monday-home-omni')
      expected_daily_order = {
        monday: {
          office: 'home',
          choice: 'omni'
        }
      }
      expect(choice_ref.to_hash).to eql(expected_daily_order)
    end
  end
end

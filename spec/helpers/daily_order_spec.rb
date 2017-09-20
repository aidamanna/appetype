require_relative '../../app/helpers/daily_order'

RSpec.describe DailyOrder, 'to_hash' do
  it 'should fail if the ref does not have three parts' do
    expect { DailyOrder.from_ref('withoutthreeparts') }.to raise_error 'The ref does not have three parts'
  end

  it 'should return a daily order' do
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

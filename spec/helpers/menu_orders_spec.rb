require 'rspec'
require_relative '../../app/helpers/menu_orders_counter'

describe 'from_records' do
  it 'should return an empty hash given an empty array' do
    expect(MenuOrdersCounter.from_records([])).to eql({})
  end
end

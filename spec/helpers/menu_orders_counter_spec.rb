require 'rspec'
require_relative '../../app/helpers/menu_orders_counter'

describe 'from_records' do
  it 'should return an empty hash given an empty array' do
    expect(MenuOrdersCounter.from_records([])).to eql({})
  end

  it 'should return a menu order' do
    records = [['friday', 'beach', 'omni', 1]]
    expected_menu_order = {
      friday: {
        beach: {
          omni: 1
        }
      }
    }
    menu_orders = MenuOrdersCounter.from_records(records)

    expect(menu_orders).to eql?(expected_menu_order)
  end
end

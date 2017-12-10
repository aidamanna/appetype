require 'rspec'
require_relative '../../app/models/menu_orders'

describe 'Base constructor' do
  it 'should fail if no days are given' do
    expect { MenuOrders.base([], ['omni'], ['home_office']) }.to raise_error 'Days cannot be empty'
  end

  it 'should fail if no choices are given' do
    expect { MenuOrders.base(['monday'], [], ['home_office']) }.to raise_error 'Choices cannot be empty'
  end

  it 'should fail if no offices are given' do
    expect { MenuOrders.base(['monday'], ['omni'], []) }.to raise_error 'Offices cannot be empty'
  end
end

describe 'Add' do
  it 'should fail when adding an invalid day' do
    base = MenuOrders.base(['monday'], ['omni'], ['home_office'])

    expect { base.add('tuesday', 'omni', 'home_office', 10) }.to raise_error 'Invalid menu order'
  end

  it 'should update counters when adding a valid order' do
    base = MenuOrders.base(['monday'], ['omni'], ['home_office'])
    base.add('monday', 'omni', 'home_office', 10)
    expected_menu_orders = {
      monday: {
        omni: {
          home_office: 10,
          total: 10
        }
      }
    }

    expect(base.to_hash).to eql(expected_menu_orders)
  end

  it 'should update counters when adding two valid orders' do
    base = MenuOrders.base(%w[monday tuesday], ['omni'], ['home_office'])
    base.add('monday', 'omni', 'home_office', 10)
    base.add('tuesday', 'omni', 'home_office', 1)
    expected_menu_orders = {
      monday: {
        omni: {
          home_office: 10,
          total: 10
        }
      },
      tuesday: {
        omni: {
          home_office: 1,
          total: 1
        }
      }
    }

    expect(base.to_hash).to eql(expected_menu_orders)
  end
end

describe 'To hash' do
  it 'should export the base menu orders when passing one day, one choice and one office' do
    menu_orders = MenuOrders.base(%w[monday], %w[omni], %w[home_office])
    expected_hash = {
      monday: {
        omni: {
          home_office: 0,
          total: 0
        }
      }
    }
    expect(menu_orders.to_hash).to eql(expected_hash)
  end

  it 'should export the base menu orders when passing one day, one choice and two offices' do
    menu_orders = MenuOrders.base(%w[monday], %w[omni], %w[home_office beach_house])
    expected_hash = {
      monday: {
        omni: {
          home_office: 0,
          beach_house: 0,
          total: 0
        }
      }
    }
    expect(menu_orders.to_hash).to eql(expected_hash)
  end

  it 'should export the base menu orders when passing one day, two choices and two offices' do
    menu_orders = MenuOrders.base(%w[monday], %w[omni veggie], %w[home_office beach_house])
    expected_hash = {
      monday: {
        omni: {
          home_office: 0,
          beach_house: 0,
          total: 0
        },
        veggie: {
          home_office: 0,
          beach_house: 0,
          total: 0
        }
      }
    }
    expect(menu_orders.to_hash).to eql(expected_hash)
  end

  it 'should export the base menu orders when passing two days, two choices and two offices' do
    menu_orders = MenuOrders.base(%w[monday tuesday], %w[omni veggie], %w[home_office beach_house])
    expected_hash = {
      monday: {
        omni: {
          beach_house: 0,
          home_office: 0,
          total: 0
        },
        veggie: {
          beach_house: 0,
          home_office: 0,
          total: 0
        }
      },
      tuesday: {
        omni: {
          beach_house: 0,
          home_office: 0,
          total: 0
        },
        veggie: {
          beach_house: 0,
          home_office: 0,
          total: 0
        }
      }
    }
    expect(menu_orders.to_hash).to eql(expected_hash)
  end
end

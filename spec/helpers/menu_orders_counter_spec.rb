describe MenuOrdersCounter do
  describe '.from_records' do
    it 'returns the default hash given an empty array' do
      expected_menu_order = {
        monday: {
          omni: { home: 0, beach: 0, total: 0 },
          veggie: { home: 0, beach: 0, total: 0 },
          out: { home: 0, beach: 0, total: 0 }
        },
        tuesday: {
          omni: { home: 0, beach: 0, total: 0 },
          veggie: { home: 0, beach: 0, total: 0 },
          out: { home: 0, beach: 0, total: 0 }
        },
        wednesday: {
          omni: { home: 0, beach: 0, total: 0 },
          veggie: { home: 0, beach: 0, total: 0 },
          out: { home: 0, beach: 0, total: 0 }
        },
        thursday: {
          omni: { home: 0, beach: 0, total: 0 },
          veggie: { home: 0, beach: 0, total: 0 },
          out: { home: 0, beach: 0, total: 0 }
        },
        friday: {
          omni: { home: 0, beach: 0, total: 0 },
          veggie: { home: 0, beach: 0, total: 0 },
          out: { home: 0, beach: 0, total: 0 }
        }
      }
      expect(MenuOrdersCounter.from_records([])).to eql(expected_menu_order)
    end

    it 'returns a menu order' do
      records = [['friday', 'omni', 'beach', 1]]
      expected_menu_order = {
        monday: {
          omni: { home: 0, beach: 0, total: 0 },
          veggie: { home: 0, beach: 0, total: 0 },
          out: { home: 0, beach: 0, total: 0 }
        },
        tuesday: {
          omni: { home: 0, beach: 0, total: 0 },
          veggie: { home: 0, beach: 0, total: 0 },
          out: { home: 0, beach: 0, total: 0 }
        },
        wednesday: {
          omni: { home: 0, beach: 0, total: 0 },
          veggie: { home: 0, beach: 0, total: 0 },
          out: { home: 0, beach: 0, total: 0 }
        },
        thursday: {
          omni: { home: 0, beach: 0, total: 0 },
          veggie: { home: 0, beach: 0, total: 0 },
          out: { home: 0, beach: 0, total: 0 }
        },
        friday: {
          omni: { home: 0, beach: 1, total: 1 },
          veggie: { home: 0, beach: 0, total: 0 },
          out: { home: 0, beach: 0, total: 0 }
        }
      }
      menu_orders = MenuOrdersCounter.from_records(records)
      expect(menu_orders).to eql(expected_menu_order)
    end
  end
end

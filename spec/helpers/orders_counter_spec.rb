describe OrdersCounter do
  describe '.from_records' do
    it 'returns the default hash given an empty array' do
      expected_order = {
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
      expect(OrdersCounter.from_records([])).to eql(expected_order)
    end

    it 'returns an order' do
      records = [['friday', 'omni', 'beach', 1]]
      expected_order = {
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
      orders = OrdersCounter.from_records(records)
      expect(orders).to eql(expected_order)
    end
  end
end

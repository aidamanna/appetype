describe OrdersBase do
  describe '.base' do
    it 'fails if no days are given' do
      expect { OrdersBase.create([], ['omni'], ['home_office']) }.to raise_error 'Days cannot be empty'
    end

    it 'fails if no choices are given' do
      expect { OrdersBase.create(['monday'], [], ['home_office']) }.to raise_error 'Choices cannot be empty'
    end

    it 'fails if no offices are given' do
      expect { OrdersBase.create(['monday'], ['omni'], []) }.to raise_error 'Offices cannot be empty'
    end
  end

  describe '#add' do
    it 'fails when adding an invalid day' do
      base = OrdersBase.create(['monday'], ['omni'], ['home_office'])

      expect { base.add('tuesday', 'omni', 'home_office', 10) }.to raise_error 'Invalid order'
    end

    it 'should update counters when adding a valid order' do
      base = OrdersBase.create(['monday'], ['omni'], ['home_office'])
      base.add('monday', 'omni', 'home_office', 10)
      expected_orders = {
        monday: {
          omni: {
            home_office: 10,
            total: 10
          }
        }
      }

      expect(base.to_hash).to eql(expected_orders)
    end

    it 'updates counters when adding two valid orders' do
      base = OrdersBase.create(%w[monday tuesday], ['omni'], ['home_office'])
      base.add('monday', 'omni', 'home_office', 10)
      base.add('tuesday', 'omni', 'home_office', 1)
      expected_orders = {
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

      expect(base.to_hash).to eql(expected_orders)
    end
  end

  describe '#to_hash' do
    it 'should export the base orders when passing one day, one choice and one office' do
      base = OrdersBase.create(%w[monday], %w[omni], %w[home_office])
      expected_hash = {
        monday: {
          omni: {
            home_office: 0,
            total: 0
          }
        }
      }
      expect(base.to_hash).to eql(expected_hash)
    end

    it 'should export the base orders when passing one day, one choice and two offices' do
      base = OrdersBase.create(%w[monday], %w[omni], %w[home_office beach_house])
      expected_hash = {
        monday: {
          omni: {
            home_office: 0,
            beach_house: 0,
            total: 0
          }
        }
      }
      expect(base.to_hash).to eql(expected_hash)
    end

    it 'should export the base orders when passing one day, two choices and two offices' do
      base = OrdersBase.create(%w[monday], %w[omni veggie], %w[home_office beach_house])
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
      expect(base.to_hash).to eql(expected_hash)
    end

    it 'should export the base orders when passing two days, two choices and two offices' do
      base = OrdersBase.create(%w[monday tuesday], %w[omni veggie], %w[home_office beach_house])
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
      expect(base.to_hash).to eql(expected_hash)
    end
  end
end

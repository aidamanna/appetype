describe Orders::Show do
  describe '#call' do
    it 'counts the orders' do
      given_a_menu
      and_some_orders
      then_it_counts_the_orders
      when_showing_the_orders
    end

    def given_a_menu
      menu = double(:menu)
      allow(Menu).to receive(:find).and_return(menu)
      allow(menu).to receive(:id)
    end

    def and_some_orders
      orders_query = double(:orders_query)
      allow(OrdersPerDayChoiceOfficeQuery).to receive(:new).and_return(orders_query)
      allow(orders_query).to receive(:call)
    end

    def then_it_counts_the_orders
      expect(OrdersCounter).to receive(:from_records)
    end

    def when_showing_the_orders
      Orders::Show.new.call(1)
    end
  end
end

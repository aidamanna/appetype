module Orders
  class Show
    def call(menu_id)
      menu = Menu.find(menu_id)
      records_array = OrdersPerDayChoiceOfficeQuery.new.call(menu.id)
      orders = OrdersCounter.from_records(records_array)

      [menu, orders]
    end
  end
end

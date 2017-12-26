class OrdersPerDayChoiceOfficeQuery
  def call(menu_id)
    sql = "select
           day,
           daily_orders->day->>'choice' as choice,
           daily_orders->day->>'office' as office,
           count(*)
          from orders, json_object_keys(daily_orders) day
          where menu_id = #{menu_id}
          group by day, office, choice;"

    ActiveRecord::Base.connection.execute(sql).values
  end
end

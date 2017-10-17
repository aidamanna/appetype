class MenuOrdersController < ApplicationController
  def show
    @menu = Menu.find(params[:id])

    sql = "select
           day,
           daily_orders->day->>'office' as office,
           daily_orders->day->>'choice' as choice,
           count(*)
          from orders, json_object_keys(daily_orders) day
          where menu_id = #{@menu.id}
          group by day, office, choice;"
    records_array = ActiveRecord::Base.connection.execute(sql).values

    @menu_orders = MenuOrdersCounter.from_records(records_array)
  end
end

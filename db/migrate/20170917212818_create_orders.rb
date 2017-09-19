class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :menu_id
      t.integer :user_id
      t.json :daily_orders
    end
  end
end

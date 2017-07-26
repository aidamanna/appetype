class CreateMenus < ActiveRecord::Migration[5.0]
  def change
    create_table :menus do |t|
      t.string :week
      t.json :daily_menus
      t.string :state
      t.string :form

      t.timestamps
    end
  end
end

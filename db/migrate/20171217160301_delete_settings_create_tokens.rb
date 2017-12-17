class DeleteSettingsCreateTokens < ActiveRecord::Migration[5.0]
  def change
    drop_table :settings
    create_table :tokens, id: false do |t|
      t.integer :user_id, null: false
      t.string :oauth_token
    end

    execute %{ ALTER TABLE "tokens" ADD PRIMARY KEY ("user_id"); }
  end
end

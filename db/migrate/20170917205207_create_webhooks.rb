class CreateWebhooks < ActiveRecord::Migration[5.0]
  def change
    create_table :webhooks do |t|
      t.string :event_id
      t.string :event_type
      t.json :form_response
    end
  end
end

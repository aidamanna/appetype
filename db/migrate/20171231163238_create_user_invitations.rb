class CreateUserInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_invitations, id: false do |t|
      t.string :token
      t.string :email
      t.datetime :accepted_at
      t.datetime :created_at, null: false
    end

    execute %{ ALTER TABLE "user_invitations" ADD PRIMARY KEY ("token"); }
  end
end

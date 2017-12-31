class CreateUserInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :user_invitations, id: false do |t|
      t.string :token
      t.string :email
      t.date :accepted_at
    end

    execute %{ ALTER TABLE "user_invitations" ADD PRIMARY KEY ("token"); }
  end
end

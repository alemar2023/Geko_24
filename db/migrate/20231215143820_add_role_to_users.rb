class AddRoleToUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :user_roles do |t|
      t.string :tag
      t.timestamps
    end

    UserRole.create tag:'customer'
    UserRole.create tag:'admin'

    add_reference :users, :user_role
  end
end

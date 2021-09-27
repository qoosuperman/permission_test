class CreateUserGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :user_groups do |t|
      t.string :name
      t.boolean :admin, default: false

      t.timestamps
    end
    add_index :user_groups, :admin
    add_reference :users, :user_group
  end
end

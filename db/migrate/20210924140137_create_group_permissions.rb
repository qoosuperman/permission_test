class CreateGroupPermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :group_permissions do |t|
      t.references :user_group
      t.references :permission_resource
      t.integer :priority, index: true

      t.timestamps
    end
  end
end

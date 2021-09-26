class CreatePermissionGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :permission_groups do |t|
      t.string :name
      t.boolean :enabled, default: true
      t.string :description

      t.timestamps
    end
  end
end

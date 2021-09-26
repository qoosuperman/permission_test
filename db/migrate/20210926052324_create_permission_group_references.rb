class CreatePermissionGroupReferences < ActiveRecord::Migration[6.1]
  def change
    create_table :permission_group_references do |t|
      t.references :permission
      t.references :permission_group
      t.timestamps
    end
  end
end

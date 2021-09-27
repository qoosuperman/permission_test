class CreatePermissionResources < ActiveRecord::Migration[6.1]
  def change
    create_table :permission_resources do |t|
      t.string :name
      t.integer :default_priority, default: 0, index: true

      t.timestamps
    end
  end
end

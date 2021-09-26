class CreatePermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :permissions do |t|
      t.references :application_resource
      t.string :name
      t.integer :allowed_actions
      t.timestamps
    end
  end
end

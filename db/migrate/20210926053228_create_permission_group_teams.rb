class CreatePermissionGroupTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :permission_group_teams do |t|
      t.references :permission_group
      t.references :team
      
      t.timestamps
    end
  end
end

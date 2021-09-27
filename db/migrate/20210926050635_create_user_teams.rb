class CreateUserTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :user_teams do |t|
      t.references :user
      t.references :team
      t.timestamps
    end
  end
end

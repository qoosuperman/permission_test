class CreateBookTable < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.bigint :user_id
      t.timestamps
    end
  end
end

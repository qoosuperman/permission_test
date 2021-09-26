class CreateApplicationResources < ActiveRecord::Migration[6.1]
  def change
    create_table :application_resources do |t|
      t.string :name, index: true
      t.string :actions
      
      t.timestamps
    end
  end
end

class CreateGoals < ActiveRecord::Migration[6.1]
  def change
    create_table :goals do |t|
      t.string :title
      t.text :description
      t.boolean :completed 
      t.integer :user_id 
    end
  end
end

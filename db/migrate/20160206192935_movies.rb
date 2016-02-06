class Movies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name 
      t.integer :director_id 
      t.integer :user_id
    end
  end
end
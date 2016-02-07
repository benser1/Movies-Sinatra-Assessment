class DeleteColumn < ActiveRecord::Migration
  def change
    remove_column :movies, :director_id, :integer
    drop_table :directors
  end
end

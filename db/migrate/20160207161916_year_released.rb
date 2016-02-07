class YearReleased < ActiveRecord::Migration
  def change
    add_column :movies, :year_released, :integer
  end
end

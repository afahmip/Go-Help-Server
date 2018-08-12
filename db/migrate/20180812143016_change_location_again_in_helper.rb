class ChangeLocationAgainInHelper < ActiveRecord::Migration[5.2]
  def change
    change_column :helpers, :longitude, :float, :null => true
    change_column :helpers, :latitude, :float, :null => true
  end
end

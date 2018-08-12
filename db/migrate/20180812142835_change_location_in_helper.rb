class ChangeLocationInHelper < ActiveRecord::Migration[5.2]
  def change
    change_column :helpers, :longitude, :float, :null => false
    change_column :helpers, :latitude, :float, :null => false
  end
end

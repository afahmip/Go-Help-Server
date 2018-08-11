class AddLongitudeLatitudeToHelpers < ActiveRecord::Migration[5.2]
  def change
    add_column :helpers, :longitude, :float
    add_column :helpers, :latitude, :float
  end
end

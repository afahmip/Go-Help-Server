class ChangeLongitudeLatitudeToNullableInHelper < ActiveRecord::Migration[5.2]
  def change
    change_column_null :helpers, :longitude, :null => true
    change_column_null :helpers, :latitude, :null => true
  end
end

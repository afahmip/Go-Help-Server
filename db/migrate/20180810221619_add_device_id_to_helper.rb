class AddDeviceIdToHelper < ActiveRecord::Migration[5.2]
  def change
    add_column :helpers, :device_id, :string
  end
end

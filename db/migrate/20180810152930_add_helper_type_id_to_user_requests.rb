class AddHelperTypeIdToUserRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :user_requests, :helper_type_id, :integer
  end
end

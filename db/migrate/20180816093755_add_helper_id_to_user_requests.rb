class AddHelperIdToUserRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :user_requests, :helper_id, :integer
  end
end

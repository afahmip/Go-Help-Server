class RemoveHelperIdFromUserRequests < ActiveRecord::Migration[5.2]
  def up
    remove_column :user_requests, :helper_id
  end

  def down
    add_column :user_requests, :helper_id, :integer
  end
end

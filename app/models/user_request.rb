class UserRequest < ApplicationRecord
  validates_presence_of :user_id, :helper_type_id, :longitude, :latitude, :device_id
end

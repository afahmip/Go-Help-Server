class Helper < ApplicationRecord
  # has_one :helper_types, dependent: :destroy

  validates_presence_of :name, :email, :phone_number, :password
end

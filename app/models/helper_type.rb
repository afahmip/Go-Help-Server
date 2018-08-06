class HelperType < ApplicationRecord
  # belongs_to :helper

  # validations
  validates_presence_of :name
end

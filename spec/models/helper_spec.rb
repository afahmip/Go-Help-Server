require 'rails_helper'

RSpec.describe Helper, type: :model do
  it { should have_one(:helper_types).dependent(:destroy) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:phone_number) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
end

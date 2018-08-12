require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new }
  
  describe 'attributes' do
    it "should have attributes name" do
      expect(user).to respond_to :name
    end

    it "should have attributes email" do
      expect(user).to respond_to :email
    end

    it "should have attributes password" do
      expect(user).to respond_to :password
    end

    it "should have attributes device_id" do
      expect(user).to respond_to :device_id
    end
  end
end
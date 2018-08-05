require 'rails_helper'

RSpec.describe "Users API", type: :request do
  # Initialize test data
  let!(:users) { create_list(:user, 10) }
  let(:user_id) { users.first.id }

  # Test suite for GET /users
  describe "GET /users" do
    # Make HTTP GET request before each example
    before { get '/users' }

    it "returns users" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /users/:id
  describe "GET /users/:id" do
    before { get "/users/#{user_id}" }

    # context "when the record exists" do
    #   it "returns the user" do
    #     expect(json).not_to be_empty
    #     expect(json['id']).to eq(user_id)
    #   end
    # end

    context "when the record does not exist" do
      let(:user_id) { 100 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
    end
  end

  # Test suite for POST /users
  describe "POST /users" do
    # valid payload
    let(:valid_attributes) {
      {
          user_id: '1',
          name: 'Bandung',
          email: 'test@yahoo.com',
          password: 'lorem',
          device_id: 'abc12345'
      }
    }

    context "when the request is valid" do
      before { post '/users', params: valid_attributes }

      it "creates a user" do
        expect(json['user_id']).to eq(1)
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end

      it "returns a validation failure message" do
        expect(response.body).to match(//)
      end
    end
  end
end
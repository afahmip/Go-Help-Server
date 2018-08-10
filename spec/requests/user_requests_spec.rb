require 'rails_helper'

RSpec.describe "UserRequests API", type: :request do
  let!(:user_requests) { create_list(:user_request, 10) }
  let(:user_request_id) { user_requests.first.id }

  describe "GET /user_requests" do
    before { get "/user_requests" }

    it "returns user_requests" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /user_requests/:id" do
    before { get "/user_requests/#{user_request_id}" }

    context "when the record exists" do
      it "returns the user_request" do
        expect(json).not_to be_empty
        expect(json['id']).to eq(user_request_id)
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the record does not exist" do
      let(:user_request_id) { 100 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe "POST /user_requests" do
    let(:valid_attributes) {
      {
          user_id: '1',
          helper_type_id: '1',
          device_id: '34343-434',
          longitude: '123.4253167',
          latitude: '453.2341523'
      }
    }

    context "when the request is valid" do
      before { post "/user_requests", params: valid_attributes }

      it "creates a user_request" do
        expect(json['user_id']).to eq(1)
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when the request is invalid" do
      before { post "/user_requests", params: { user_id: '999'} }

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end
    end
  end
end
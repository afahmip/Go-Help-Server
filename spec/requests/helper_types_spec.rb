require 'rails_helper'

RSpec.describe "HelperTypes API", type: :request do
  let!(:helper_types) { create_list(:helper_type, 10) }
  let(:helper_type_id) { helper_types.first.id }

  describe "GET /helper_types" do
    before { get '/helper_types' }

    it "returns helper_types" do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it "returns status code 200" do
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /helper_types/:id" do
    before { get "/helper_types/#{helper_type_id}" }

    context "when the record exists" do
      it "returns the helper_type" do
        expect(json).not_to be_empty
        expect(json['id']).to eq(helper_type_id)
      end

      it "returns status code 200" do
        expect(response).to have_http_status(200)
      end
    end

    context "when the record does not exist" do
      let(:helper_type_id) { 100 }

      it "returns status code 404" do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe "POST /helper_types" do
    let(:valid_attributes) { { name: 'Polisi' } }

    context "when the request is valid" do
      before { post "/helper_types", params: valid_attributes }

      it "creates a helper_type" do
        expect(json['name']).to eq('Polisi')
      end

      it "returns status code 201" do
        expect(response).to have_http_status(201)
      end
    end

    context "when the response is invalid" do
      before { post "/helper_types", params: {} }

      it "returns status code 422" do
        expect(response).to have_http_status(422)
      end
    end
  end
end
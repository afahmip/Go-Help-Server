# require 'rails_helper'
#
# RSpec.describe "Helpers API", type: :request do
#   let!(:helpers) { create_list(:helper, 10) }
#   let(:helper_id) { helpers.first.id }
#
#   describe "GET /helpers" do
#     before { get "/helper" }
#
#     it "returns helpers" do
#       expect(json).not_to be_empty
#       expect(json.size).to eq(10)
#     end
#
#     it "returns status code 200" do
#       expect(response).to have_http_status(200)
#     end
#   end
#
#   describe "GET /helpers/:id" do
#     before { get "/helper/#{helper_id}" }
#
#     context "when the record exists" do
#       it "returns the helpers" do
#         expect(json).not_to be_empty
#         expect(json['id']).to eq(helper_id)
#       end
#
#       it "returns status code 200" do
#         expect(response).to have_http_status(200)
#       end
#     end
#
#     context "when the record does not exist" do
#       let(:helper_id) { 100 }
#
#       it "returns status code 404" do
#         expect(response).to have_http_status(404)
#       end
#     end
#   end
# end
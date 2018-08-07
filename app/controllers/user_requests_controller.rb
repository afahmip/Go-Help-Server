class UserRequestsController < ApplicationController
  before_action :set_user_request, only: [:show, :update, :destroy]

  # GET /user_requests
  def index
    @user_requests = UserRequest.all
    json_response(@user_requests)
  end

  # POST /user_requests
  def create
    @user_request = UserRequest.create!(user_request_params)
    json_response(@user_request, :created)
  end

  # GET /user_requests/:id
  def show
    json_response(@user_request)
  end

  # PUT /user_requests/:id
  def update
    @user_request.update(user_request_params)
    head :no_content
  end

  # DELETE /user_requests/:id
  def destroy
    @user_request.destroy
    head :no_content
  end

  private

  def user_request_params
    params.permit(:user_id, :helper_id, :longitude, :latitude, :device_id)
  end

  def set_user_request
    @user_request = UserRequest.find(params[:id])
  end

end

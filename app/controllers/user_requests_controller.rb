require_relative 'helpers/distance_helper'
require_relative 'helpers/notification_helper'

class UserRequestsController < ApplicationController
  include DistanceHelper, NotificationHelper

  before_action :set_user_request, only: [:show, :update, :destroy]

  # GET /user_requests
  def index
    @user_requests = UserRequest.all
    json_response(@user_requests)
  end

  # POST /user_requests
  def create
    @user_request = UserRequest.create!(user_request_params)
    @helpers = Helper.all

    @helpers.each { |helper|
      NotificationHelper.push_notification(helper.device_id)
    }
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

  # POST /accept_request
  def accept_request
    @user_request = UserRequest.find(params[:user_request_id])
    if not @user_request.helper_id
      @user_request.update(accept_request_params)
      render json: {
          status: 200,
          message: "Request successfully accepted"
      }.to_json
    else
      render json: {
          status: 500,
          message: "Request already been accepted"
      }.to_json
    end
  end

  # POST /retrieve_request
  def filter_request
    @user_requests = UserRequest.all
    @result = []

    @user_requests.each { |request|
      if request.helper_type_id == params[:helper_type_id]
        location_user = DistanceHelper::init_location(request.latitude, request.longitude)
        location_helper = DistanceHelper::init_location(params[:latitude].to_f, params[:longitude].to_f)
        distance_between = DistanceHelper::get_distance(location_user, location_helper)

        if DistanceHelper::is_helper_close_to_user(distance_between)
          @result.push(request)
        end
      end
    }
    json_response(@result)
  end

  private

  def accept_request_params
    params.permit(:helper_id)
  end

  def user_request_params
    params.permit(:user_id, :helper_type_id, :longitude, :latitude, :device_id)
  end

  def set_user_request
    @user_request = UserRequest.find(params[:id])
  end

end

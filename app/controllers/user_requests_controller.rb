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

  # POST /retrieve_request
  def filter_request
    @user_requests = UserRequest.all
    @result = []

    @user_requests.each { |request|
      if request.helper_type_id == params[:helper_type_id]
        location_user = init_location(request.latitude, request.longitude)
        location_helper = init_location(params[:latitude].to_f, params[:longitude].to_f)
        puts distance(location_user, location_helper)
        @result.push(request)
      end
    }
    json_response(@result)
  end

  private

  def init_location(lat, lon)
    [lat, lon]
  end

  def distance (loc1, loc2)
    rad_per_deg = Math::PI/180  # PI / 180
    rkm = 6371                  # Earth radius in kilometers
    rm = rkm * 1000             # Radius in meters

    dlat_rad = (loc2[0]-loc1[0]) * rad_per_deg  # Delta, converted to rad
    dlon_rad = (loc2[1]-loc1[1]) * rad_per_deg

    lat1_rad, lon1_rad = loc1.map {|i| i * rad_per_deg }
    lat2_rad, lon2_rad = loc2.map {|i| i * rad_per_deg }

    a = Math.sin(dlat_rad/2)**2 + Math.cos(lat1_rad) * Math.cos(lat2_rad) * Math.sin(dlon_rad/2)**2
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))

    rm * c # Delta in meters
  end

  def user_request_params
    params.permit(:user_id, :helper_type_id, :longitude, :latitude, :device_id)
  end

  def set_user_request
    @user_request = UserRequest.find(params[:id])
  end

end

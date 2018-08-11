class HelperController < ApplicationController
  before_action :set_helper, only: [:show, :update, :destroy, :update_location]

  # GET /helper
  def index
    @helpers = Helper.all
    json_response(@helpers)
  end

  # POST /helper
  def create
    @helper = Helper.create!(helper_params)
    @helper_type = HelperType.find(params[:helper_type_id])
    puts @helper_type.name
    json_response(@helper, :created)
  end

  # GET /helper/:id
  def show
    puts helper_params
    json_response(@helper)
  end

  # PUT /helper/:id
  def update
    @helper.update(helper_params)
    head :no_content
  end

  # POST /update_helper_location
  def update_location
    @helper.update(location_params)
    head :no_content
  end

  # DELETE /helper/:id
  def destroy
    @helper.destroy
    head :no_content
  end

  private

  def location_params
    params.permit(:longitude, :latitude)
  end

  def helper_params
    params.permit(:name, :email, :password, :phone_number, :helper_type_id, :device_id)
  end

  def set_helper
    @helper = Helper.find(params[:id])
  end
end

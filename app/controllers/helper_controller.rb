class HelperController < ApplicationController
  before_action :set_helper, only: [:show, :update, :destroy]

  # GET /helper
  def index
    @helpers = Helper.all
    json_response(@helpers)
  end

  # POST /helper
  def create
    @helper = Helper.create!(helper_params)
    json_response(@helper, :created)
  end

  # GET /helper/:id
  def show
    json_response(@helper)
  end

  # PUT /helper/:id
  def update
    @helper.update(helper_params)
    head :no_content
  end

  # DELETE /helper/:id
  def destroy
    @helper.destroy
    head :no_content
  end

  private

  def helper_params
    params.permit(:name, :email, :password, :phone_number, :helper_type_id)
  end

  def set_helper
    @helper = Helper.find(params[:id])
    @helper_type = HelperType.find(params[:helper_type_id])
  end
end

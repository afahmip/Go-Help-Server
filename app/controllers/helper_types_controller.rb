class HelperTypesController < ApplicationController
  before_action :set_helper_type, only: [:show, :update, :destroy]

  # GET /helper_types
  def index
    @helper_types = HelperType.all
    json_response(@helper_types)
  end

  # GET /helper_types/:id
  def show
    json_response(@helper_type)
  end

  # POST /helper_types
  def create
    @helper_type = HelperType.create!(helper_type_params)
    json_response(@helper_type, :created)
  end

  # PUT /helper_types/:id
  def update
    @helper_type.update(helper_type_params)
    head :no_content
  end

  # DELETE /helper_types/:id
  def destroy
    @helper_type.destroy
    head :no_content
  end

  private
    def helper_type_params
      params.permit(:name)
    end

    def set_helper_type
      @helper_type = HelperType.find(params[:id])
    end
end

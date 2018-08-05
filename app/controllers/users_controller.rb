class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show

  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render :show, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PUT /users
  def update
    if @user.update(user_params)
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE
  def destroy
    @user.destroy
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.permit(:user_id, :name, :email, :password, :device_id)
    end
end

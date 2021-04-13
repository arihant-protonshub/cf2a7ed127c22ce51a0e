class Api::UserController < ApplicationController
  before_action :set_user, only: [:update, :destroy, :show]
  protect_from_forgery with: :null_session

  def index
    per_page = 3
    page = params[:page].to_i || 1
    offset = per_page * (page -1)
    users = User.all.limit(per_page).offset(offset)
    render json: users
  end

  def show
    render json: @user
  end  

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: {errors: user.errors}
    end
  end

  def update
    if @user.update(user_params)
      render json: user
    else
      render json: {errors: user.errors}
    end
  end

  def destroy
    if @user.destroy
      render json: {}
    else
      render json: {errors: @user.errors}, status: :unprocessable_entity 
    end  
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end

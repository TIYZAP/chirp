class UsersController < ApplicationController

  before_action :require_user, only: [:follow_user, :unfollow_user]

  def index
      @users = User.all
      render json: @users
  end


  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors.full_messages, status: :unprocessable_entity
    end

  end

  def log_in
    @user = User.find_by(email: params[:email]).try(:authenticate, params[:password])
    if @user
      render json: @user
    else
      render json: ["Incorrect Username or Password."], status: :unauthorized
    end
  end

  def follow_user
    current_user.follow!(User.find(params[:id]))
    render json: current_user
  end

  def unfollow_user
    current_user.unfollow!(User.find(params[:id]))
    render json: current_user
  end


  def all_followers
    @followers = User.find(params[:id]).followers(User
    render json: @followers
  end

  private

  def user_params
    params.permit(:name, :email, :password, :avatar, :api_token)
  end

end

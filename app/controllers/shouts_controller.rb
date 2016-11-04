class ShoutsController < ApplicationController

  before_action :set_shout, only: :show
  before_action :require_user, only: [:create]

  def index
    if current_user
      @shouts = Shout.timeline(current_user).page(params[:page] || 1).per(10)
    else
      @shouts = Shout.all.order("created_at DESC").page(params[:page] || 1).per(10)
    end
    render json: @shouts
  end

  def show
    @shout.body
  end

  def create
    @shout = Shout.new(shout_params)
    @shout.user = current_user
    if @shout.save
      render json: @shout
    else
      render json: @shout.errors.full_messages, status: :unprocessable_entity
    end
  end

  private

  def set_shout
    @shout = Shout.find(params[:id])
  end

  def shout_params
    params.permit(:body)
  end
end

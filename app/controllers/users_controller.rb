require 'pry'

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def index
    @clubs = Club.all
  end

  def show
    @clubs = current_user.clubs
  end

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to user_path(@user)
    end
  end

  private

    def user_params
      params.require(:user).permit(
        :first_name,
        :last_name,
        :email,
        :password,
        :admin
      )
    end

    def set_user
      @user = User.find(params[:id])
    end
end

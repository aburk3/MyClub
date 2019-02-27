require 'pry'

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def show
    binding.pry
    
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
        :username,
        :email,
        :password,
        :admin
      )
    end

    def set_user
      @user = User.find(params[:id])
    end
end

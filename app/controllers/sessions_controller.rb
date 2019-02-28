require 'pry'

class SessionsController < ApplicationController
  def new
    redirect_to user_path(current_user) unless !current_user
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path
    end
  end

  def create_facebook
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end

    session[:user_id] = @user.id

    redirect_to user_path(@user)
  end

  def destroy
    session.delete :user_id

    redirect_to root_url
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end

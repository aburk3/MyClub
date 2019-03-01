require 'pry'

class SessionsController < ApplicationController
  def new
    redirect_to user_path(current_user) unless !current_user
    @user = User.new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      # They logged in via OAuth
      
      # The person's 100% trusted email coming from Facebook
      oauth_email = request.env["omniauth.auth"]["info"]["email"]
      oauth_name = request.env["omniauth.auth"]["info"]["name"]
      oauth_image = request.env["omniauth.auth"]["info"]["image"]
      if @user = User.find_by(:email => oauth_email)
        session[:user_id] = @user.id

        redirect_to user_path(@user)
      else
        @user = User.new(:email => oauth_email, :password_digest => SecureRandom.hex, :name => oauth_name, :image => oauth_image)
        @user.password = SecureRandom.hex
        @user.first_name = @user.name.split.first
        @user.last_name = @user.name.split.last
        if @user.save
          session[:user_id] = @user.id

          redirect_to user_path(@user)
        else
          raise @user.errors.full_messages.inspect
        end
      end
    else
      # Normal Login with email/password
      @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to signin_path
      end
    end
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

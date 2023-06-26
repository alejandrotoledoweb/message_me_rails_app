class SessionsController < ApplicationController
  before_action :find_user, only: [:create]
  def new; end

  def create
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_url
      flash[:notice] = 'Logged in!'
    else
      flash[:alert] = 'Invalid username or password'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash.now[:success] = 'Logged out!'
    redirect_to root_url
  end

  def find_user
    @user = User.find_by(username: params[:username])
  end
end

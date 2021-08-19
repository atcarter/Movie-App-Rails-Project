class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to :controller => 'movies', :action => 'index'
    else
      redirect_to login_path, alert: "Incorrect credentials."
    end
  end

  def omniauth
    user = User.omniauth(auth)
    if user.valid?
      session[:user_id] = user.id
      redirect_to :controller => 'movies', :action => 'index'
    else
      redirect_to login_path, alert: "Google log-in has failed."
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end

  private
  def auth
    request.env['omniauth.auth']
  end
end
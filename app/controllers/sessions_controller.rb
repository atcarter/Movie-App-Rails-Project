class SessionsController < ApplicationController
  def new
  end

  def create
  end

  def omniauth
    User.find_or_create_by(uid: auth['uid'], provider: auth['provider']) do |u|
      u.email = auth['info']['email']
      u.username = auth['info']['name']
      u.password = SecureRandom.hex(10)
    end
    if user.valid?
      session[:user_id] = user.id
      redirect_to movies_path
    else
      
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to 
  end

  private
  def auth
    request.env['omniauth.auth']
  end
end
module ApplicationHelper
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def admin?
    if current_user
      true if current_user.username == "admin"
    else
      false
    end
  end
end

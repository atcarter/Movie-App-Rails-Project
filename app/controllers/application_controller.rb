class ApplicationController < ActionController::Base
  include ApplicationHelper

  private
  def redirect_if_not_signed_in?
    redirect_to login_path unless logged_in?
  end

  def redirect_if_not_admin?
    redirect_to movies_path unless admin?
  end
end

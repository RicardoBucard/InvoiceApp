class ApplicationController < ActionController::Base
  before_action :must_login
  prepend_before_action :set_current_user

  def must_login
    return if @current_user.present?

    redirect_to login_path
  end

  def set_current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
class ApplicationController < ActionController::Base
  before_action :must_login
  prepend_before_action :set_current_user
  protect_from_forgery with: :exception, if: Proc.new { |c| c.request.format != 'application/json' }
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  def must_login
    return if @current_user.present?

    redirect_to login_path, alert: t("application.must_login_error")
  end

  def set_current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
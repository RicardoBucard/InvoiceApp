class ApplicationController < ActionController::Base
  before_action :must_login
  prepend_before_action :set_current_user
  protect_from_forgery with: :exception, if: Proc.new { |c| c.request.format != 'application/json' }
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  # Ensures the presence of a logged-in current user before accessing most actions.
  # Exceptions are generating authentication token, logging in, logging out, confirming email, checking if an email has already been registered,
  # and rendering the landing page.
  #
  # @note This method is used as a before_action to ensure a user with a confirmed email is logged-in.
  #
  # @return [HTTP Redirect] Redirects to the login path if the current user is not present.
  def must_login
    return if @current_user.present?

    redirect_to login_path, alert: t("application.must_login_error")
  end

  # Sets the current user by retrieving the user based on the user ID stored in the session.
  #
  # @note This method ensures the availability of the current user for the session, used to know if the user is logged in or not.
  #
  # @return [User, nil] The current user found by the user ID stored in the session, or nil if not found.
  def set_current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
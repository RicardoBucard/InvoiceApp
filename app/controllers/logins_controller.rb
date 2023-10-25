class LoginsController < ApplicationController
  include FindsUserByAuthToken
  include AuthenticateSession
  skip_before_action :must_login

  def authenticate_user
    user = find_user_by_auth_token(auth_token: params[:new][:auth_token].strip)

    redirect_to login_path, alert: t(".auth_token_not_found") and return unless user
    redirect_to login_path, alert: t(".unconfirmed_token") and return unless user.confirmed?

    authenticate_session(user)

    redirect_to users_path, notice: t(".authenticate_session")
  end

  def logout
    reset_session
    flash[:notice] = t(".logout_notice")
    redirect_to login_path
  end
end

module Session::LoginUser
  include User::FindsUserByAuthToken
  include Session::AuthenticateSession

  # Logs in a user based on the provided `auth_token`.
  #
  # This method attempts to log in a user by finding the user associated with the provided
  # auth_token. It then performs validation checks and session authentication before
  # redirecting the user to the appropriate path. If the user exists and has confirmed their auth_token,
  # they are authenticated. 
  #
  # @param [String] auth_token The authentication token used for user login
  #
  # @return [HTTP Redirect] Redirects to the login page with a message saying the user wasn't found
  # @return [HTTP Redirect] Redirects to the login page with a message saying the auth_token hasn't been confirmed
  # @return [HTTP Redirect] Redirects to the invoices index page with a sucess message
  def login_user(auth_token)
    user = find_user_by_auth_token(auth_token)

    redirect_to login_path, alert: t("logins.login.auth_token_not_found") and return unless user
    redirect_to login_path, alert: t("logins.login.unconfirmed_token") and return unless user.confirmed?
    
    authenticate_session(user)

    redirect_to invoices_path, notice: t("logins.login.authenticate_session")
  end
end
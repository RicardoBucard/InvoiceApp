module Session::LoginUser
  include User::FindsUserByAuthToken
  include Session::AuthenticateSession

  def login_user(auth_token)
    user = find_user_by_auth_token(auth_token)

    redirect_to login_path, alert: t("logins.login.auth_token_not_found") and return unless user
    redirect_to login_path, alert: t("logins.login.unconfirmed_token") and return unless user.confirmed?
    
    authenticate_session(user)

    redirect_to invoices_path, notice: t("logins.login.authenticate_session")
  end
end
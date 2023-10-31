module Session::LogoutUser
  # Logs out the user and ends the session.
  #
  # This method logs out the user by resetting the session data, ending the user's session.
  # It then redirects the user to the login path with a notice confirming the logout.
  #
  # @return [HTTP Redirect] Redirects to the login page with a message saying the user has been logged out
  def logout_user
    reset_session
    redirect_to login_path, notice: t("logins.logout.logout_notice")
  end
end
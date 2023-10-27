module LogoutUser
  def logout_user
    reset_session
    redirect_to login_path, notice: t("logins.logout.logout_notice")
  end
end
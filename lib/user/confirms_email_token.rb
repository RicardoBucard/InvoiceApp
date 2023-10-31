module User::ConfirmsEmailToken
  include User::ActivatesEmailConfirmToken

  # Confirms the user creation, by turning confirm_token to nil
  #
  # This method uses the `activate_email_confirm_token` method from the `User::ActivatesEmailConfirmToken` module
  # that turns the confirm_token to nil and then redirect the user to the login page. If the user is not found,
  # it redirects to the registration page
  #
  # @option [Integer] user_id The method uses the `user_id` to find a user.
  #
  # @return [HTTP Redirect] Redirects to the register page with a message saying the user wasn't found
  # @return [HTTP Redirect] Redirects to the login page with a message saying the token has been confirmed
  def confirms_email(user_id)
    user = User.find(user_id)
    if user
      activate_email_confirm_token(user)
      redirect_to login_path, notice: t("users.confirm_email.confirm_success")
    else
      redirect_to register_path, alert: t("users.confirm_email.user_not_found")
    end
  end
end
module User::ActivatesEmailConfirmToken
  # Turns the confirm_token to nil, indicating that the email has been confirmed.
  #
  # This method updates the user's confirm_token record attributing it to nil,
  # which is used in the login to indicate if the auth_token is active.
  #
  # @option [User] user The user whose email confirm_token is being nullified
  #
  # @return [Boolean] Returns `true` if the email confirm_token is successfully nullified
  def activate_email_confirm_token(user)
    user.update_columns(confirm_token: nil)
  end
end
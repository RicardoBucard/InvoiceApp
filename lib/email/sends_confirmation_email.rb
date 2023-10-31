module Email::SendsConfirmationEmail
  include User::FindsOrCreatesNewUser
  include User::SetUserTokens

  # Sends a confirmation email after finding or creating a user.
  #
  # This method initiates the process of finding an existing user by email or creating
  # a new user if one doesn't exist using the `User::FindsOrCreatesNewUser` module.
  # It then sets new secure user tokens (auth_token and confirm_token) using the
  # `User::SetUserTokens` module. Finally, it sends a confirmation email to the provided email address
  # via `RegisterMailer` action.
  #
  # @param [String] email The email address of the user
  #
  # @return [void]
  def sends_confirmation_email(email)
    return unless (user = find_or_create(email))
    set_user_tokens(user)
    RegisterMailer.send_email(user, user.auth_token).deliver_later
  end
end

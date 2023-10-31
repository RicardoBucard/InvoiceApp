module User::SetUserTokens
  include User::GeneratesUserToken
  
  # Sets random secure tokens for a user.
  #
  # This method uses the `generates_token` method from the `User::GeneratesUserToken` module to generate
  # random secure tokens for a user. It then updates the user's authentication token and confirmation token
  # by assigning these newly generated tokens.
  #
  # @option [User] user The user for whom tokens are being set
  #
  # @return [void]
  def set_user_tokens(user)
    auth_token = generates_token
    confirm_token = generates_token
    user.update_columns(auth_token: auth_token, confirm_token: confirm_token )
  end
end
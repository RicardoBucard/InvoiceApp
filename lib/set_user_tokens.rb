module SetUserTokens
  include GeneratesUserToken

  def set_user_tokens(user)
    auth_token = generates_token
    confirm_token = generates_token
    user.update_columns(auth_token: auth_token, confirm_token: confirm_token )
  end
end
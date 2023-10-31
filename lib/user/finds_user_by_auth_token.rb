module User::FindsUserByAuthToken
  # Finds a user by authentication token.
  #
  # This method queries to find a user based on the provided authentication token.
  #
  # @option [String] auth_token The authentication token used to find the user
  #
  # @return [User, nil] The user associated with the provided authentication token, or nil if not found
  def find_user_by_auth_token(token)
    User.find_by(auth_token: params[:new][:auth_token])
  end
end
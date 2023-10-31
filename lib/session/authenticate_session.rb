module Session::AuthenticateSession

  # Authenticates the user session.
  #
  # This method authenticates the user session by resetting the current session, to end it if it exists,
  # assigning the user's ID to the session's `:user_id` attribute, logging in the user.
  #
  # @param [User] user The user object whose session is being authenticated
  #
  # @return [void]
  def authenticate_session(user)
    reset_session
    session[:user_id] = user.id
  end
end
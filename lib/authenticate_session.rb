module AuthenticateSession
  def authenticate_session(user)
    reset_session
    session[:user_id] = user.id
  end
end
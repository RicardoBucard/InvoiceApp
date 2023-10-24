module FindsUserByAuthToken
  def find_user_by_auth_token(token)
    User.find_by(auth_token: params[:new][:auth_token])
  end
end
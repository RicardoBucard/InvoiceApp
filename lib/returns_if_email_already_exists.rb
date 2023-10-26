module ReturnsIfEmailAlreadyExists
  def email_already_exists?(email)
    User.find_by(email: params[:email]).present? ? true : false
  end
end
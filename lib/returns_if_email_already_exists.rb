module ReturnsIfEmailAlreadyExists
  def email_already_exists?(email)
    user = User.find_by(email: params[:email])
    user.present? ? true : false
  end
end
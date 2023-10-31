module User::ReturnsIfEmailAlreadyExists
  # Checks if an email already exists in the user records.
  #
  # This method verifies if an email already exists in the user records by querying the database.
  #
  # @option [String] email The email address to check for existence in user records
  #
  # @return [Boolean] Returns true if the email exists in user records, otherwise false
  def email_already_exists?(email)
    User.find_by(email: params[:email]).present? ? true : false
  end
end
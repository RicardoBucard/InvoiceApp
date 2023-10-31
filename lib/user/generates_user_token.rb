module User::GeneratesUserToken
  # Generates a secure random token.
  #
  # This method creates and returns a secure random token using SecureRandom library's
  # `urlsafe_base64` method, which generates a cryptographically secure random string.
  #
  # @return [String] A securely generated random token
  def generates_token
    SecureRandom.urlsafe_base64.to_s
  end
end
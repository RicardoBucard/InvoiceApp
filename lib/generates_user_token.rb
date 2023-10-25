module GeneratesUserToken
  def generates_token
    SecureRandom.urlsafe_base64.to_s
  end
end
class User < ApplicationRecord
  has_secure_token :auth_token

  before_create do
    self.auth_token = SecureRandom.urlsafe_base64
  end
end

class User < ApplicationRecord
  has_secure_token :auth_token
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}
  before_save :generate_auth_token, :generate_confirm_token

  def email_token_activate
    update_columns(confirm_token: nil)
  end

  def confirmed?
    confirm_token.blank?
  end
  
  def generate_confirm_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end
  
  def generate_auth_token
    self.auth_token = SecureRandom.urlsafe_base64.to_s
  end
end

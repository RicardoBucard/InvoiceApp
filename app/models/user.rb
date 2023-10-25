class User < ApplicationRecord
  has_secure_token :auth_token
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, uniqueness: { case_sensitive: true }, presence: true

  def email_token_activate
    update_columns(confirm_token: nil)
  end

  def confirmed?
    confirm_token.blank?
  end
end

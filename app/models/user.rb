# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  auth_token    :string
#  confirm_token :string
#  email         :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_users_on_auth_token  (auth_token) UNIQUE
#
class User < ApplicationRecord
  has_secure_token :auth_token
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, uniqueness: { case_sensitive: true }, presence: true

  # Checks if the user's confirm_token is blank, indicating a confirmed user.
  #
  # This method verifies if the user's confirm_token is blank. A blank confirmation token
  # indicates that the user has been confirmed.
  #
  # @return [Boolean] Returns true if the user is confirmed (confirm_token is blank), otherwise false
  def confirmed?
    confirm_token.blank?
  end
end

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

  def confirmed?
    confirm_token.blank?
  end
end

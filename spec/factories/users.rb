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
FactoryBot.define do
  factory :valid_user, class: User do
    email { Faker::Internet.email }
    auth_token { nil }
    confirm_token { nil }
  end
  
  factory :invalid_user, class: User do
    email { "test" }
    auth_token { nil }
    confirm_token { nil }
  end
end

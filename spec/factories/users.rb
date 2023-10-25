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

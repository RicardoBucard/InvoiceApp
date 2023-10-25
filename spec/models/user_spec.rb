require 'rails_helper'

RSpec.describe User, type: :model do  
  context 'When User is valid' do
    let(:user) { build(:valid_user) }
    it do
      should validate_uniqueness_of(:email)
      should validate_presence_of(:email)
      should allow_value(user.email).for(:email)
      should allow_value(user.auth_token).for(:auth_token)
      should allow_value(user.confirm_token).for(:confirm_token)
    end
  end

  context 'When User is invalid' do
    let(:user) { build(:invalid_user) }
    it do
      should_not allow_value(user.email).for(:email)
    end
  end
end

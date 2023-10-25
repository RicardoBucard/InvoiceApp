class RegisterMailer < ApplicationMailer
  def send_email(user, auth_token)
    @user = user
    @auth_token = auth_token
    mail to: @user.email, subject: 'Validate your Invoice App access token'
  end
end

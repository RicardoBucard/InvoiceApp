class RegisterMailer < ApplicationMailer
  def send_email(user)
    @user = user

    mail to: @user.email, subject: 'Validate your Invoice App access token'
  end
end

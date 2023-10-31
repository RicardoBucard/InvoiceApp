class RegisterMailer < ApplicationMailer

  # Sends an email to validate auth_token for a user
  #
  # This method sends an email to validate access to the Invoice App and includes
  # the access token for a specific user and a button to activate the token.
  #
  # @param [User] :user The user for whom the access validation email is sent
  # @param [String] :auth_token The authentication token for the user
  #
  # @return [Mail::Message] The generated email message
  def send_email(user, auth_token)
    @user = user
    @auth_token = auth_token
    mail to: @user.email, subject: 'Validate your Invoice App access token'
  end
end

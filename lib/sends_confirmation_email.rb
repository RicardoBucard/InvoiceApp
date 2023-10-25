module SendsConfirmationEmail
  include FindsOrCreatesNewUser
  include SetUserTokens

  def sends_confirmation_email(email)
    return unless (user = find_or_create(email))
    set_user_tokens(user)
    RegisterMailer.send_email(user, user.auth_token).deliver_later
  end
end

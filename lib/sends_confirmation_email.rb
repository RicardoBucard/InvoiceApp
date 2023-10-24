module SendsConfirmationEmail
  include FindsOrCreatesNewUser

  def sends_confirmation_email(email)
    return unless (user = find_or_create(email))
    RegisterMailer.send_email(user).deliver_later
  end
end

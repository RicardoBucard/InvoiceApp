module User::FindsOrCreatesNewUser
  def find_or_create(email)
    user = User.find_by(email: email.strip.downcase)

    if user
      user
    else
      User.create(email: email.strip.downcase)
    end
  end
end

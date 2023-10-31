module User::FindsOrCreatesNewUser
  # Finds or creates a user based on the provided email.
  #
  # This method attempts to find a user by the provided email address. If the user exists,
  # it returns the user. If no user is found, it creates a new user with the given email
  # and returns the newly created user.
  #
  # @option [String] email The email address used to find or create a user
  #
  # @return [User] The user found or created based on the provided email
  def find_or_create(email)
    user = User.find_by(email: email.strip.downcase)

    if user
      user
    else
      User.create(email: email.strip.downcase)
    end
  end
end

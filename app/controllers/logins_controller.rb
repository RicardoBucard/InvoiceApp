class LoginsController < ApplicationController
  include Session::LoginUser
  include Session::LogoutUser
  skip_before_action :must_login

  # GET /login
  # Logs in a user using their authentication token.
  #
  # This method is responsible for logging in a user by taking an authentication token
  # as a parameter and passing it to the `login_user` method from `Session::LoginUser` module, which handles the logout process.
  #
  # @return [void]
  def login
    login_user(params[:new][:auth_token].strip)
  end

  # DELETE /logout
  # Logs out the current user.
  #
  # This method is responsible for logging out the currently authenticated user.
  # It calls the `logout_user` method from `Session:LogoutUser` module, which handles the logout process.
  #
  # @return [void]
  def logout
    logout_user
  end
end

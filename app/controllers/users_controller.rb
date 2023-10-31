class UsersController < ApplicationController
  include User::ReturnsIfEmailAlreadyExists
  include User::ConfirmsEmailToken
  skip_before_action :must_login
 
  # GET /users/:id/confirm_email
  #
  # Action for confirming the auth_token sent to the user's email
  #
  # This method triggers the process of confirming the user's auth_token, allowing them to then login with it.
  # It utilizes the `User::ConfirmsEmailToken` module to handle the process of finding the user and
  # activating the token.
  #
  # @option params [Integer] :id The number to identify the user to confirm their email
  #
  # @return [void] 
  def confirm_email
    confirms_email(params[:id])
  end

  # POST /email_already_exists
  #
  # Checks if a user with a specific email already exists.
  #
  # This method queries the User::ReturnsIfEmailAlreadyExists module to determine
  # whether a user with the provided email already exists in the database.
  #
  # @option params [Integer] :email The email to check for existing user
  #
  # @return [JSON] A JSON response indicating if the email is already associated with a user or not
  def email_already_exists
    render json: { email_already_exists: email_already_exists?(params[:email]) }
  end

  private
  # Strong parameters for user attributes.
  #
  # @note This method defines permitted parameters for a user.
  #
  # @return [ActionController::Parameters] The permitted user parameters
  def user_params
    params.require(:user).permit(:email)
  end
end

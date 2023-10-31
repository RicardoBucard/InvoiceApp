class RegistersController < ApplicationController
  include Email::SendsConfirmationEmail
  skip_before_action :must_login
  
  # GET /register
  #
  # Action for creating a new user instance.
  #
  # This method initializes a new user instance for the create method
  #
  # @return [void]
  def new
    @user = User.new
  end

  # POST /register
  # Creates finds a user or creates one and sends an auth_token confirmation email.
  #
  # This method triggers the process of creating a new auth_token and sending a confirmation
  # email to the provided email address. It utilizes the `Email::SendsConfirmationEmail`
  # module to handle user identification, creation, and email dispatch.
  #
  # @option [String] :email The email address provided for user registration
  #
  # @return [HTTP Redirect] Redirects to the login page and displays a message saying
  # an email has been sent and needs confirmation
  def create
    sends_confirmation_email(params[:user][:email])

    redirect_to login_path, notice: t(".register_create_success")
  end
end

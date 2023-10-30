class UsersController < ApplicationController
  include User::ReturnsIfEmailAlreadyExists
  include User::ConfirmsEmailToken
  skip_before_action :must_login
 
  def confirm_email
    confirms_email(params[:id])
  end

  def email_already_exists
    render json: { email_already_exists: email_already_exists?(params[:email]) }
  end

  private
  def user_params
    params.require(:user).permit(:email)
  end
end

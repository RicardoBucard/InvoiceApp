class UsersController < ApplicationController
  include User::ReturnsIfEmailAlreadyExists
  include User::ActivatesEmailConfirmToken
  skip_before_action :must_login
 
  def confirm_email
    user = User.find(params[:id])
    if user
      activate_email_confirm_token(user)
      redirect_to login_path, notice: t(".confirm_success")
    else
      redirect_to register_path, alert: t(".user_not_found")
    end
  end

  def email_already_exists
    render json: { email_already_exists: email_already_exists?(params[:email]) }
  end

  private
  def user_params
    params.require(:user).permit(:email)
  end
end

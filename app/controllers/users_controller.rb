class UsersController < ApplicationController
  include ReturnsIfEmailAlreadyExists
  skip_before_action :must_login
 
  def confirm_email
    user = User.find(params[:id])
    if user
      user.email_token_activate
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

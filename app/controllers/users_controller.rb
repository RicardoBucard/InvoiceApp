class UsersController < ApplicationController
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

  private
  def user_params
    params.require(:user).permit(:email)
  end
end

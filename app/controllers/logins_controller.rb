class LoginsController < ApplicationController
  include Session::LoginUser
  include Session::LogoutUser
  skip_before_action :must_login

  def login
    login_user(params[:new][:auth_token].strip)
  end

  def logout
    logout_user
  end
end

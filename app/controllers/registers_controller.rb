class RegistersController < ApplicationController
  include SendsConfirmationEmail
  skip_before_action :must_login

  def new
    @user = User.new
  end

  def create
    sends_confirmation_email(params[:user][:email])

    redirect_to login_path, notice: t(".register_create_success")
  end
end

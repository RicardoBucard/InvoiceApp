module User::ConfirmsEmailToken
  include User::ActivatesEmailConfirmToken

  def confirms_email(user_id)
    user = User.find(user_id)
    if user
      activate_email_confirm_token(user)
      redirect_to login_path, notice: t("users.confirm_email.confirm_success")
    else
      redirect_to register_path, alert: t("users.confirm_email.user_not_found")
    end
  end
end
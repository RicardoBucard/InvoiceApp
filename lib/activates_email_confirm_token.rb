module ActivatesEmailConfirmToken
  def activate_email_confirm_token(user)
    user.update_columns(confirm_token: nil)
  end
end
class PagesController < ApplicationController
  skip_before_action :must_login

  def home
  end
end

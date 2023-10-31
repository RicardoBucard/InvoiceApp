class PagesController < ApplicationController
  skip_before_action :must_login

  # GET /
  # Renders the home.html.slim view.
  #
  # This method is used to render the 'home.html.slim' view file.
  #
  # @return [HTTP Redirect] Renders the home page
  def home
  end
end

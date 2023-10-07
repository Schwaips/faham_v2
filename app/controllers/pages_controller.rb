class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    flash[:notice] = "Welcome to the home page!"
  end
end

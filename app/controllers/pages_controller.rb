class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    flash[:notice] = "Welcome to the home page!"
    
    @trusted_customers = TrustedCustomer.to_be_displayed
  end
end

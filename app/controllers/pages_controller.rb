class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @trusted_customers = TrustedCustomer.to_be_displayed
    @testimonies = Testimony.all
    @lead = Lead.new
  end
end

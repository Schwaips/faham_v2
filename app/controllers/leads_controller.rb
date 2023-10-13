class LeadsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:create]

  def create
    @lead = authorize Lead.new(lead_params)
    if @lead.save
      flash[:notice] = "Votre demande a bien été prise en compte, merci !"
      redirect_to root_path
    else
      render "pages/home", alert: "Veuillez remplir tous les champs"
    end
  end

  private 

  def lead_params
    params.require(:lead).permit(:first_name, :last_name, :email, :phone_number, :company, :customer_type, :message)
  end
end

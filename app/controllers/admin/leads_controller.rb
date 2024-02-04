class Admin::LeadsController < Admin::DashboardController
  def index
    if params[:search]
      @leads = Lead.where("first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ? OR phone_number ILIKE ? OR message ILIKE ? OR company ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @leads = Lead.all
    end
  end

  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(lead_params)

    if @lead.save
      redirect_to admin_leads_path, notice: "Lead créé avec succès."
    else
      render :new, alert: "Veuillez vérifier les erreurs ci-dessous #{@lead.errors.full_messages}", status: :unprocessable_entity
    end
  end

  private

  def lead_params
    params.require(:lead).permit(:first_name, :last_name, :email, :phone_number, :message, :company, :customer_type)
  end
end

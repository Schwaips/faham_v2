class Admin::LeadsController < Admin::DashboardController
  def index
    @leads = Lead.all
  end

  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(lead_params)
    authorize @lead, policy: :admin_base_policy
    if @lead.save
      redirect_to admin_leads_path, notice: "Lead créé avec succès."
    else
      render :new
    end
  end

  private

  def lead_params
    params.require(:lead).permit(:first_name, :last_name, :email, :phone_number, :message)
  end
end

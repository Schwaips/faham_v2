class Admin::LeadsController < Admin::DashboardController
  def index
    if params[:search]
      @leads = Lead.where("first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ? OR phone_number ILIKE ? OR message ILIKE ? OR company ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @leads = Lead.all
    end
  end

  def show
    @lead = Lead.find(params[:id])
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

  def edit
    @lead = Lead.find(params[:id])
  end

  def update
    @lead = Lead.find(params[:id])

    if @lead.update(lead_params)
      redirect_to admin_leads_path, notice: "Lead modifié avec succès."
    else
      render :edit, alert: "Veuillez vérifier les erreurs ci-dessous.", status: :unprocessable_entity
    end
  end

  def destroy
    @lead = Lead.find(params[:id])
    @lead.destroy

    redirect_to admin_leads_path, notice: "Lead supprimé avec succès."
  end

  private

  def lead_params
    params.require(:lead).permit(:first_name, :last_name, :email, :phone_number, :message, :company, :customer_type)
  end
end

class Admin::LeadsController < Admin::DashboardController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @leads = Lead.all
  end

  private 

  def require_admin
    unless current_user.admin?
      redirect_to root_path, alert: "Vous n'êtes pas autorisé à accéder à cette page."
    end
  end
end

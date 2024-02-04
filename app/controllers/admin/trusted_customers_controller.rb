class Admin::TrustedCustomersController < Admin::DashboardController

  def index
    if params[:search]
      @trusted_customers = TrustedCustomer.where("title ILIKE ?", "%#{params[:search]}%")
    else
      @trusted_customers = TrustedCustomer.all
    end
  end

  def show
    @trusted_customer = TrustedCustomer.find(params[:id])
  end

  def new
    @trusted_customer = TrustedCustomer.new
  end

  def create
    @trusted_customer = TrustedCustomer.new(trusted_customer_params)
    if @trusted_customer.save
      redirect_to admin_trusted_customers_path, notice: "Succès"
    else
      render :new, alert: "Erreur", status: :unprocessable_entity
    end
  end

  def edit
    @trusted_customer = TrustedCustomer.find(params[:id])
  end

  def update
    @trusted_customer = TrustedCustomer.find(params[:id])
    if @trusted_customer.update(trusted_customer_params)
      redirect_to admin_trusted_customers_path, notice: "Succès"
    else
      render :edit, alert: "Erreur", status: :unprocessable_entity
    end
  end

  def destroy
    @trusted_customer = TrustedCustomer.find(params[:id])
    @trusted_customer.destroy
    redirect_to admin_trusted_customers_path, notice: "Succès"
  end


  private 


  def trusted_customer_params
    params.require(:trusted_customer).permit(:title, :photo)
  end
end

class Admin::TestimoniesController < Admin::DashboardController

  def index
    if params[:search]
      @testimonies = Testimony.where("title ILIKE ? OR author ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
    else
      @testimonies = Testimony.all
    end
  end

  def show
    @testimony = Testimony.find(params[:id])
  end

  def new
    @testimony = Testimony.new
  end

  def create
    @testimony = Testimony.new(testimony_params)
    if @testimony.save
      redirect_to admin_testimonies_path, notice: "Témoignage ajouté avec succès"
    else
      render :new, status: :unprocessable_entity, notice: "Erreur, veuillez vériifer les champs"
    end
  end

  def edit
    @testimony = Testimony.find(params[:id])
  end

  def update
    @testimony = Testimony.find(params[:id])
    if @testimony.update(testimony_params)
      redirect_to admin_testimonies_path, notice: "Témoignage modifié avec succès"
    else
      render :edit, status: :unprocessable_entity, notice: "Erreur, veuillez vériifer les champs"
    end
  end

  private

  def testimony_params
    params.require(:testimony).permit(:title, :description, :author, :company)
  end
end

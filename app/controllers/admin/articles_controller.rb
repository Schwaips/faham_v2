class Admin::ArticlesController < Admin::DashboardController

  def index
    if params[:search]
      @articles = Article.where("title ILIKE ?", "%#{params[:search]}%")
    else
      @articles = Article.all.order('created_at DESC')
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to admin_articles_path, notice: "Article créé avec succès."
    else
      render :new, alert: "Veuillez vérifier les erreurs ci-dessous.", status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if params[:article][:photos] == [""] || params[:article][:photos].nil?
      update_params = article_params.except(:photos)
    else
      update_params = article_params
    end
  
    if @article.update(update_params)
      redirect_to admin_articles_path, notice: "Article modifié avec succès."
    else
      render :edit, alert: "Veuillez vérifier les erreurs ci-dessous.", status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to admin_articles_path, notice: "Article supprimé avec succès."
  end 

  private 

  def require_admin
    unless current_user.admin?
      redirect_to root_path, alert: "Vous n'êtes pas autorisé à accéder à cette page."
    end
  end

  def article_params
    params.require(:article).permit(:title, :content, :intro_text, :category, :publication_date, :category, :author, photos: [])
  end
end

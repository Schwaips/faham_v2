class Admin::ArticlesController < Admin::DashboardController

  def index
    if params[:search]
      @articles = Article.where("title ILIKE ?", "%#{params[:search]}%")
    else
      @articles = Article.all.order('created_at DESC')
    end
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    authorize @article, policy: :admin_base_policy
    if @article.save
      redirect_to admin_articles_path, notice: "Article créé avec succès."
    else
      render :new
    end
  end

  private 

  def require_admin
    unless current_user.admin?
      redirect_to root_path, alert: "Vous n'êtes pas autorisé à accéder à cette page."
    end
  end

  def article_params
    params.require(:article).permit(:title, :content, :publication_date, :category, :author, photos: [])
  end
end

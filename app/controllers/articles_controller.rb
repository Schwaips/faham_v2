class ArticlesController < ApplicationController

  def index
    @articles = policy_scope(Article.all)
  end

  def show
    @article = authorize Article.find(params[:id])
  end

  def new
    @article = authorize Article.new
  end

  def create
    @article = authorize Article.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity, alert: "Article not created #{article.errors.full_messages}"
    end
  end

  private 

  def article_params
    params.require(:article).permit(:title, :content, :publication_date, :category, :author, photos: [])
  end
end

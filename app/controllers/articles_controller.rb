class ArticlesController < ApplicationController

  def index
    @articles = policy_scope(Article.all)
  end

  def show
    @article = Article.find(params[:id])
  end
end

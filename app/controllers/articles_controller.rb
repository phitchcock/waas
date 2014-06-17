class ArticlesController < ApplicationController

  before_action :set_wiki
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @article = Article.new
  end


  def create
    @article = @wiki.articles.build(article_params)

    if @article.save
      redirect_to [@wiki, @article], notice: 'Created article'
    else
      flash[:error] = 'Article was not created'
      render :new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to [@wiki, @article], notice: 'article updated'
    else
      render :edit
    end
  end

  def destroy
    if @article.destroy
      redirect_to wiki_articles_path, notice: 'article destroyed'
    else
      render [@wiki, @article], notice: 'try again'
    end
  end

  private

  def article_params
    params.require(:article).permit!
  end

  def set_wiki
    @wiki = Wiki.friendly.find(params[:wiki_id])
  end

  def set_article
    @article = Article.friendly.find(params[:id])
  end

end
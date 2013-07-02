class ArticlesController < ApplicationController

  before_filter :authenticate_user!, :except => [:show, :index]

  def index
  	@articles = Article.page(params[:page]).per_page(3)
  end

  def show
  	getArticleById(params[:id])
    @article.increment!(:views)
    @comments = Comment.where("article_id = ?", params[:id])
  end

  def new
  	@article = Article.new
  	@categories = Category.select("id, title")
  end

  def create
  	@article = Article.new(params[:article])
  	@article.user_id = current_user.try(:id) || 1
  	if @article.save
  		flash[:success] = "Статья '#{@article.title}' успешно созданна"
  		redirect_to articles_path
  	else
  		flash.now[:errors] = "Статья не созданна"
  		render 'new'
  	end
  end

  def edit
    getArticleById(params[:id])
    @categories = Category.select("id, title")
  end

  def update
    getArticleById(params[:id])
    if @article.update_attributes(params[:article])
      flash[:success] = "Статья '#{@article.title}' успешно обновленна"
      redirect_to article_path
    else
      flash.now[:errors] = "Не удалось обновить категорию"
      render 'new'
    end
  end

  def destroy
    getArticleById(params[:id])
    @article.destroy
    flash[:success] = "Статья удалена"
    redirect_to articles_path
  end

  protected

    def getArticleById(param_id)
      @article = Article.find(param_id)
    end

end

class CategoriesController < ApplicationController

  before_filter :authenticate_user!, :except => [:show, :index]

  def index
  	@categories = Category.all
  end

  def show
  	getCategoryById
  end

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(params[:category])
  	if @category.save
  		flash[:success] = "Категория '#{@category.title}' успешно созданна"
  		redirect_to categories_path
  	else
  		flash.now[:errors] = "Категория не созданна"
  		render 'new'
  	end
  end

  def edit
  	getCategoryById
  end

  def update
  	getCategoryById
  	if @category.update_attributes(params[:category])
  		flash[:success] = "Категория '#{@category.title}' успешно обновленна"
  		redirect_to categories_path
  	else
  		flash.now[:errors] = "Не удалось обновить категорию"
  		render 'new'
  	end
  end

  def destroy
    getCategoryById
    @category.destroy
    flash[:success] = "Категория удалена"
    redirect_to categories_path
  end

  protected

    def getCategoryById
      @category = Category.find(params[:id])
    end

end

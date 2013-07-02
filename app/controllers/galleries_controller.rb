class GalleriesController < ApplicationController

  before_filter :authenticate_user!, :except => [:show, :index]
  
  def index
  	@galleries = Gallery.all
  end

  def new
  	@gallery = Gallery.new
    @albums = Album.select("id, name")
  end

  def create
  	@gallery = Gallery.new(params[:gallery])
  	if @gallery.save
  		redirect_to galleries_path, notice:"Изображение загруженно"
	else
		render "new"
	end
  end

  def show
  	getImageById
  end

  def edit
  end

  def destroy
  	getImageById
    @gallery.destroy
    flash[:success] = "Изображение удаленно"
    redirect_to galleries_path
  end

  def download
    if Gallery.exists?(params[:id])
        @gallery = Gallery.find(params[:id])
        #send_data @gallery.
    else
      no_record_found
    end
  end

  private

  	def getImageById
  			@gallery = Gallery.find(params[:id])
  	end

end

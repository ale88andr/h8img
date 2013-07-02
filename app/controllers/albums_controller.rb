class AlbumsController < ApplicationController

	before_filter :authenticate_user!, :except => [:show, :index]
	
	def index
		@albums = Album.all
	end

	def new
		@album = Album.new
	end

	def create
		@album = Album.new(params[:album])
		if @album.save
			redirect_to albums_path, notice:"Альбом '#{@album.name}' успешно создан"
		else
			render "new"
		end
	end

	def show
		@album = Album.find(params[:id])
	end

end

class BlogController < ApplicationController

  def index
  	@articles = Article.order("created_at desc").limit(3)
  	@images = Gallery.limit(4)
  end

end

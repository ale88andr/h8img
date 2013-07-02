class CommentsController < ApplicationController

	before_filter :authenticate_user!

	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.new(params[:comment])
		@comment.user_id = current_user.id
		@comment.save
		redirect_to article_path(@article)
	end

end

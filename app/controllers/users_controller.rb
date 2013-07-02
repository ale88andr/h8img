class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@micropost = @user.microposts
  end
end

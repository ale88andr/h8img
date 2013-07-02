class QmsController < ApplicationController

  layout 'qms'

  def index
  	@qms = Qms.where('recipient = ?', current_user.id).limit(10)
  end

  def show
  end

  def create
  	@qms = current_user.qms.build(params[:qms])
  	if @qms.save
  		render 'show', notice:"Отправленно"
  	else
  		render 'show', notice:"Не отправленно из-за ошибок"
  	end
  end

end

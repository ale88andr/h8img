class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from ActiveRecord::RecordNotFound, with: :no_record_found

  private

  	def no_record_found
  		render "public/404", :status => 404, layout: nil
  	end

end

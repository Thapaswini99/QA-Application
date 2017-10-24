class SessionsController < ApplicationController

	def destroy
		session[:user_id] = nil
		session[:omniauth] = nil
		redirect_to root_url, notice: "signed out successfully"

	end
end
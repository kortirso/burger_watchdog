class ContainersController < ApplicationController
	def index
		send_file ("/var/www/html/burger_watchdog/#{params[:id]}")
		render nothing: true
	end
end
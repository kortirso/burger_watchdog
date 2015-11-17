class ContainersController < ApplicationController
	def index
		str = params[:id]
		send_file ("/var/www/html/burger_watchdog/#{str}")
		render nothing: true
	end
end
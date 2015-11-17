class ContainersController < ApplicationController
	def index
		if params[:id] == 'container.version'
			send_file ('/var/www/html/burger_watchdog/container.version')
		end
		render nothing: true
	end
end
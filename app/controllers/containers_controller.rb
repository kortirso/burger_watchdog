class ContainersController < ApplicationController
	def index
		if params[:id] == 'container'
			send_file("/var/www/html/burger_watchdog/container.version")
		else
			File.open("/var/www/html/burger_watchdog/container.version", "r") do |f|
				f.each_line do |line|
					version = line
				end
			end
			send_file("/var/www/html/burger_watchdog/burger_king_#{version}.tar")
		end
	end
end
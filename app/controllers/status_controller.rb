class StatusController < ApplicationController
	def index
		Gameserver.check_statuses
		@servers = Gameserver.all
	end
end
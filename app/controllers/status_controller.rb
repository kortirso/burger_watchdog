class StatusController < ApplicationController
	def index
		@servers = Gameserver.all
	end
end
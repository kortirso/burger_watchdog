class StatusController < ApplicationController
	def index
		@servers = Gameserver.all
		@opened = @servers.opened
		@work = @opened.working
	end
end
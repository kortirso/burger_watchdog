class StatusController < ApplicationController
    def index
        @servers = Gameserver.all
        @opened = @servers.opened
        @work = @opened.working
        @nolink = @opened.nolink
        @nodesk = @opened.errored.count - @nolink.count
    end
end
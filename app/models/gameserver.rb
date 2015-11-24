require 'open-uri'

class Gameserver < ActiveRecord::Base
    #validates :ip, :address, :open, :status, :desk_check, :uptime, :uptime_periods, presence: true

    scope :opened,      -> { where open: 'true' }
    scope :working, -> { where status: true, desk_check: true }
    scope :errored,     -> { where('status == ? OR desk_check == ?', false, false) }
    scope :nolink,      -> { where status: false }

    def self.check_statuses
        t = Time.current.hour
        servers = Gameserver.opened
        servers.each do |server|
            begin
                source = "http://#{server.ip}/?format=json"
                response = open(source)
                data = JSON.parse(response.read)

                if t > 7 && t < 19
                    server.desk_check = false
                    data["points"].each do |point|
                        server.desk_check = true if point > 0
                    end
                end

                server.status = true

                if server.uptime_periods == 288 # Если данные собираются 3 дня
                    server.uptime_periods = 0
                    server.uptime = 0
                end

                if data["deploy"].any?
                    server.version = data["deploy"]
                else
                    server.version = data["desks"][0]["bufer"].nil? ? 2 : 1
                end

                server.uptime += 1 if server.desk_check
                server.uptime_periods += 1

                server.save!
            rescue Exception
                server.error
            rescue Errno::ECONNREFUSED
                server.error
            rescue EOFError
                false
            rescue OpenURI::HTTPError
                server.error
            rescue Errno::EHOSTUNREACH
                server.error
            rescue Errno::ENETUNREACH
                server.error
            rescue JSON::ParserError
                server.error
            rescue NET::ERR_CONNECTION_TIMED_OUT
                server.error
            end
        end
        servers.errored.each do |server|
            Rollbar.warning("Server #{server.ip} CRITICAL Error", server: server.ip) unless server.status
            Rollbar.warning("There is desk error at #{server.ip}", server: server.ip) if server.desk_check == false && t > 7 && t < 19
        end
    end

    def error
        self.status = false
        self.uptime_periods += 1
        self.save!
    end
end

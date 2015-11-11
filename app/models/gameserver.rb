require 'open-uri'

class Gameserver < ActiveRecord::Base
	#validates :ip, :address, :open, :status, :desk_check, :uptime, :uptime_periods, presence: true

	scope :opened,		-> { where open: 'true' }
	scope :working,	-> { where status: true, desk_check: true }

	def self.check_statuses
		servers = Gameserver.opened
		servers.each do |server|
			begin
				source = "http://#{server.ip}/?format=json"
				response = open(source)
				data = JSON.parse(response.read)
				server.desk_check = false
				data["desks"].each do |desk|
					server.desk_check = true if desk["statistic"]["desk_points"] > 0
				end
				server.status = true

				if server.uptime_periods == 288 # Если данные собираются 3 дня
					server.uptime_periods = 0
					server.uptime = 0
				end

				server.uptime += 1 if server.desk_check
				server.uptime_periods += 1

				server.save!
			rescue Exception
				server.status = false
				server.desk_check = false
				server.uptime_periods += 1
				server.save!
			rescue Errno::ECONNREFUSED
				server.status = false
				server.desk_check = false
				server.uptime_periods += 1
				server.save!
			rescue EOFError
				false
			rescue OpenURI::HTTPError
				server.status = false
				server.desk_check = false
				server.uptime_periods += 1
				server.save!
			rescue Errno::EHOSTUNREACH
				server.status = false
				server.desk_check = false
				server.uptime_periods += 1
				server.save!
			rescue Errno::ENETUNREACH
				server.status = false
				server.desk_check = false
				server.uptime_periods += 1
				server.save!
			rescue JSON::ParserError
				server.status = false
				server.desk_check = false
				server.uptime_periods += 1
				server.save!
			rescue NET::ERR_CONNECTION_TIMED_OUT
				server.status = false
				server.desk_check = false
				server.uptime_periods += 1
				server.save!
			end
		end
	end
end

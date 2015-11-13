require 'open-uri'

class Gameserver < ActiveRecord::Base
	#validates :ip, :address, :open, :status, :desk_check, :uptime, :uptime_periods, presence: true

	scope :opened,		-> { where open: 'true' }
	scope :working,	-> { where status: true, desk_check: true }
	scope :errored,		-> { where('status == ? OR desk_check == ?', false, false) }

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
		t = Time.current.hour
		servers.errored.each do |server|
			Rollbar.warning("Server #{server.ip} CRITICAL Error") unless server.status
			Rollbar.warning("There is desk error at #{server.ip}") if server.desk_check == false && t > 9 && t < 22
		end
	end

	def error
		self.status = false
		self.desk_check = false
		self.uptime_periods += 1
		self.save!
	end
end

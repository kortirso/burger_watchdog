require 'timeout'
require 'socket'

class Gameserver < ActiveRecord::Base
	validates :restaurant, :ip, :address, presence: true

	def self.check_statuses
		servers = Gameserver.all
		servers.each do |server|
			if server.ping
				begin
					server.link = true
					response = HTTParty.get("http://#{server.ip}/?format=json")
					if response.nil?
						server.status = false
					else
						server.status = response.parsed_response['attempts'] ? true : false
					end
				rescue Errno::ECONNREFUSED
					server.status = false
					server.save!
				end
			else
				server.link = false
				server.status = false
			end
			server.save!
		end
	end

	def ping
		host = self.ip
		begin
			Timeout.timeout(1) do
				s = TCPSocket.new(host, 'echo')
				s.close
				return true
			end
		rescue Errno::ECONNREFUSED
			return true
		rescue Timeout::Error, Errno::ENETUNREACH, Errno::EHOSTUNREACH
			return false
		end
	end
end

class Gameserver < ActiveRecord::Base
	validates :restaurant, :ip, :address, presence: true

	def self.check_statuses
		servers = Gameserver.all
		servers.each do |server|
			response = HTTParty.get("http://localhost/?format=json")
			server.status = response.body.size > 0 ? true : false
			server.save!
		end
	end
end

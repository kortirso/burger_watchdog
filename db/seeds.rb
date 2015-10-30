Gameserver.all.each do |server|
	server.destroy
end

Gameserver.create(restaurant: 1, ip: '10.0.6.2', address: 'МСК, пл. Киевского вокзала, 2, ТЦ Европейский, 4 этаж')
require 'csv'

Gameserver.all.each do |server|
    server.destroy
end

# Загрузка из файла
CSV.read("#{Rails.root}/db/gameservers.csv", encoding: 'utf-8', col_sep: ';')[0..-1].each do |row|
    Gameserver.create(address: row[0].to_s, ip: row[1].to_s, open: row[2].to_s)
end

Central.create if Central.count == 0

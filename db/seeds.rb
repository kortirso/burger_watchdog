require 'csv'

Gameserver.all.each do |server|
	server.destroy
end

# Загрузка из файла
CSV.read("#{Rails.root}/db/gameservers.csv", encoding: 'utf-8', col_sep: ';')[0..-1].each do |row|
	Gameserver.create(address: row[0].to_s, ip: row[1].to_s, open: row[2].to_s)
end

Config.create monster_timeout: 30, monster_percent: 5, monster_heal: 200, streak_bonus: 3, corporate: 150, corporate_periods: 10, corporate_koef: 2, corporate_minimum: 90, corporate_maximum: 210, speed_koef: 2, speed_count: 10, speed_times: 30, triangle_koef: 2, manager_koef: 2, level_percent: 1, level_point: 100, triangle_periods: '', green_mark_points: 3, yellow_mark_points: 2, red_mark_points: -5, default_mark_points: 1, disposals: 10000, dessert_bonus: 5, max_green_time: 90
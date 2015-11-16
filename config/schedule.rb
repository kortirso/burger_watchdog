set :environment, "development"

every 15.minutes do
	runner "Gameserver.check_statuses"
end
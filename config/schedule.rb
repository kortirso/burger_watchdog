set :environment, "development"

every 15.minutes do
    runner "Gameserver.check_statuses"
end

every 20.minutes do
    runner "Workday.check_statistic"
end

every 30.minutes do
    runner "Manager.check_statistic"
end
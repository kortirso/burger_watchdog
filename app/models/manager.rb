require 'open-uri'
require 'csv'

class Manager < ActiveRecord::Base
    def self.set_data(x)
        restaurants = []
        strings = x.split(",")
        periods = []
        strings.each { |string| periods.push(string.split("-")) }
        periods.each { |period| period.size == 1 ? restaurants.push(period[0].to_i) : (period[0]..period[1]).each { |x| restaurants.push(x.to_i) } }
        where("restaurant IN (?)", restaurants)
    end

    def self.set_time(x)
        times = []
        strings = x.split(".")
        periods = []
        strings.each { |string| periods.push(string.split("-")) }

        if periods[1].size == 1
            if periods[0].size == 1 # 10.10.2015
                times.push("#{x}")
            else # 10-15.10.2015
                (periods[0][0]..periods[0][1]).each { |day| times.push("#{day}.#{periods[1][0]}.#{periods[2][0]}") }
            end
        else
            months = [1,3,5,7,8,10,12]
            if months.include?(periods[1][0].to_i)
                finish = 31
            elsif periods[1][0].to_i == 2
                finish =28
            else
                finish = 30
            end
            if periods[0].size == 1 # 10.10-11.2015
                (periods[0][0].to_i..finish).each { |day| times.push("#{day}.#{periods[1][0]}.#{periods[2][0]}") }
                (1..periods[0][0].to_i).each { |day| times.push("#{day}.#{periods[1][1]}.#{periods[2][0]}") }
            else # 10-15.10-11.2015
                (periods[0][0].to_i..finish).each { |day| times.push("#{day}.#{periods[1][0]}.#{periods[2][0]}") }
                (1..periods[0][1].to_i).each { |day| times.push("#{day}.#{periods[1][1]}.#{periods[2][0]}") }
            end
        end

        where("day IN (?)", times)
    end

    def self.build_csv(options)
        CSV.generate(options) do |csv|
            csv << column_names
            all.each do |days|
                csv << days.attributes.values_at(*column_names)
            end
        end
    end

    def self.check_statistic
        servers = Gameserver.newest
        servers.each do |server|
            begin
                source = "http://#{server.ip}/workdays.json"
                response = open(source)
                data = JSON.parse(response.read)

                day = Manager.find_or_create_by(restaurant: data["restaurant"], day: data["day"])
                day.turbo = data["manager"][0]
                day.greens = data["manager"][1]
                day.reds = data["manager"][2]
                day.save!

            rescue EOFError
                false
            rescue Exception
                false
            end
        end
    end
end

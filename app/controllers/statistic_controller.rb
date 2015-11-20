class StatisticController < ApplicationController
	def index
		Workday.check_statistic
		@workdays = Workday.all
		respond_to do |format|
			format.html { }
		end
	end

	def load
		@workdays = Workday.all
		if params["third"]
			@workdays = @workdays.where(restaurant: params["params"]["third"].to_i)
		end
		respond_to do |format|
			format.csv { send_data @workdays.build_csv }
		end
	end
end
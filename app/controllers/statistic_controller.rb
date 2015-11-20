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
		respond_to do |format|
			format.csv { send_data @workdays.build_csv }
		end
	end
end
class StatisticController < ApplicationController
	def index
		@workdays = Workday.all
		respond_to do |format|
			format.html { }
			format.csv { send_data @workdays.build_csv }
		end
	end
end
class StatisticController < ApplicationController
	def index
		@workdays = Workday.all
		respond_to do |format|
			format.html { }
		end
	end

	def load
		@data = Workday.all
		respond_to do |format|
			format.csv { send_data @data.build_csv }
		end
	end
end
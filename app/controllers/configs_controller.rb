class ConfigsController < ApplicationController
	def index
		@config = Config.first || Config.create
		respond_to do |format|
			format.html { render :index }
			format.json { render json: @config }
		end
	end

	def update
		config = Config.first
		config.update_attributes! config_params
		redirect_to configs_path
	end

	private
	def config_params
		params.require(:config).permit :monster_timeout, :monster_percent, :monster_heal, :streak_bonus, :corporate, :corporate_koef, :speed_koef, :triangle_koef, :speed_count, :speed_times, :corporate_minimum, :corporate_maximum, :manager_koef, :level_percent, :level_point, :triangle_periods, :corporate_periods, :disposals, :dessert_bonus, :blinking, :max_green_time, :green_mark_points, :yellow_mark_points, :red_mark_points, :default_mark_points
	end
end
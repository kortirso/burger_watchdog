class CentralsController < ApplicationController
    def index
        @centrals = Central.first || Central.create
        respond_to do |format|
            format.html { render :index }
            format.json { render json: @centrals }
        end
    end

    def update
        centrals = Central.first
        centrals.update_attributes! central_params
        redirect_to centrals_path
    end

    def restore
        Central.first.destroy
        @centrals = Central.create
        render template: 'centrals/index'
    end

    private
    def central_params
        params.require(:central).permit :monster_timeout, :monster_percent, :monster_heal, :streak_bonus, :corporate, :corporate_koef, :speed_koef, :triangle_koef, :speed_count, :speed_times, :corporate_minimum, :corporate_maximum, :manager_koef, :level_percent, :level_point, :triangle_periods, :corporate_periods, :disposals, :dessert_bonus, :blinking, :max_green_time, :green_mark_points, :yellow_mark_points, :red_mark_points, :default_mark_points
    end
end
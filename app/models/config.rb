class Config < ActiveRecord::Base
	validates :monster_timeout, :monster_percent, :monster_heal, :streak_bonus, :corporate, :speed_koef, :triangle_koef, :manager_koef, :level_percent, :level_point, :corporate_koef, :corporate_periods, :disposals, :dessert_bonus, :speed_count, :speed_times, :max_green_time, presence: true, numericality: { greater_than: 0 }
end

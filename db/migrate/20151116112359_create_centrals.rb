class CreateCentrals < ActiveRecord::Migration
	def change
		create_table :centrals do |t|
			t.integer :monster_timeout, default: 30
			t.integer :monster_percent, default: 5
			t.integer :monster_heal, default: 200
			t.integer :streak_bonus, default: 3
			t.integer :corporate, default: 150
			t.integer :corporate_periods, default: 10
			t.integer :corporate_koef, default: 2
			t.integer :corporate_minimum, default: 90
			t.integer :corporate_maximum, default: 210
			t.integer :speed_koef, default: 2
			t.integer :speed_count, default: 10
			t.integer :speed_times, default: 30
			t.integer :triangle_koef, default: 2
			t.integer :manager_koef, default: 2
			t.integer :level_percent, default: 1
			t.integer :level_point, default: 100
			t.string :triangle_periods, default: ''
			t.integer :green_mark_points, default: 3
			t.integer :yellow_mark_points, default: 2
			t.integer :red_mark_points, default: -5
			t.integer :default_mark_points, default: 1
			t.float :disposals, default: 10000
			t.integer :dessert_bonus, default: 5
			t.integer :max_green_time, default: 90
			t.timestamps null: false
		end
	end
end

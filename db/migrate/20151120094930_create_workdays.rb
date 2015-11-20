class CreateWorkdays < ActiveRecord::Migration
	def change
		create_table :workdays do |t|
			t.integer :restaurant
			t.integer :mains
			t.integer :sauces
			t.integer :desserts
			t.integer :drinks
			t.integer :garnirs
			t.integer :check
			t.integer :time
			t.integer :dish_count
			t.integer :triangles
			t.integer :full_triangles
			t.integer :points
			t.integer :smena
			t.integer :number
			t.integer :dishes
			t.integer :yellow
			t.integer :red
			t.integer :green
			t.string :name
			t.timestamps null: false
		end
	end
end

class CreateGameservers < ActiveRecord::Migration
	def change
		create_table :gameservers do |t|
			t.integer :restaurant
			t.string :ip
			t.string :address
			t.timestamps null: false
		end
	end
end

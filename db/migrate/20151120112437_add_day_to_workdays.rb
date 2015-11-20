class AddDayToWorkdays < ActiveRecord::Migration
	def change
		add_column :workdays, :day, :string
	end
end

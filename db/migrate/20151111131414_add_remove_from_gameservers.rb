class AddRemoveFromGameservers < ActiveRecord::Migration
	def change
		remove_column :gameservers, :restaurant
		remove_column :gameservers, :link

		add_column :gameservers, :open, :string, default: 'false'
		add_column :gameservers, :desk_check, :boolean, default: true
		add_column :gameservers, :uptime, :integer, default: 0
		add_column :gameservers, :uptime_periods, :integer, default: 0
	end
end

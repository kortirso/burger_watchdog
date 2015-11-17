class AddStatusToGameservers < ActiveRecord::Migration
	def change
		add_column :gameservers, :status, :boolean, default: true
	end
end

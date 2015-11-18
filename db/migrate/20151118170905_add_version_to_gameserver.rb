class AddVersionToGameserver < ActiveRecord::Migration
	def change
		add_column :gameservers, :version, :integer, default: 1
	end
end

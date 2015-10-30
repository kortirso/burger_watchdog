class AddLinkToGameservers < ActiveRecord::Migration
	def change
		add_column :gameservers, :link, :boolean, default: true
	end
end

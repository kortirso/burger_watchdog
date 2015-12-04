class AddKillsToTables < ActiveRecord::Migration
    def change
        add_column :workdays, :kills, :integer, default: 0
        add_column :managers, :kills, :integer, default: 0
    end
end

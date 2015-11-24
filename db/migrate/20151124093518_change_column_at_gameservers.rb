class ChangeColumnAtGameservers < ActiveRecord::Migration
    def change
        change_table :gameservers do |t|
            t.change :version, :string
        end
    end
end

class ChangeDeshcountInWorkdays < ActiveRecord::Migration
    def change
        change_table :workdays do |t|
            t.change :dish_count, :float
        end
    end
end

class CreateManagers < ActiveRecord::Migration
    def change
        create_table :managers do |t|
            t.integer :restaurant
            t.string :day
            t.integer :turbo, default: 0
            t.integer :greens, default: 0
            t.integer :reds, default: 0
            t.timestamps null: false
        end
    end
end

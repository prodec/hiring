class CreateConservations < ActiveRecord::Migration
  def change
    create_table :conservations do |t|
      t.integer :number

      t.timestamps null: false
    end
  end
end

class CreateRoadways < ActiveRecord::Migration
  def change
    create_table :roadways do |t|
      t.string :tipo
      t.string :rodovia
      t.string :sentido
      t.integer :conservacao

      t.timestamps
    end
  end
end

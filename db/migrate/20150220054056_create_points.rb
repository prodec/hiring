class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.string :tipo
      t.string :rodovia
      t.string :sentido
      t.integer :conservacao

      t.timestamps
    end
  end
end
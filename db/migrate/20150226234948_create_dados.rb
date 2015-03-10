class CreateDados < ActiveRecord::Migration
  def change
    create_table :dados do |t|
      t.string :tipo
      t.string :rodovia
      t.string :sentido
      t.integer :conservacao

      t.timestamps null: false
    end
  end
end

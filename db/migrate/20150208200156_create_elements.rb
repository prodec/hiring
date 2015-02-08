class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.string :name
      t.references :conservation, index: true

      t.timestamps null: false
    end
    add_foreign_key :elements, :conservations
  end
end

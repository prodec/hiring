class CreateHighways < ActiveRecord::Migration
  def change
    create_table :highways do |t|
      t.string :name
      t.references :direction, index: true

      t.timestamps null: false
    end
    add_foreign_key :highways, :directions
  end
end

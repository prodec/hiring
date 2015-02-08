class AddHighwayToElements < ActiveRecord::Migration
  def change
    add_reference :elements, :highway, index: true
    add_foreign_key :elements, :highways
  end
end

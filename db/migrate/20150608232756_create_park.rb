class CreatePark < ActiveRecord::Migration
  def change
    create_table :parks do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.string :icon, default: "Park.png"
    end
  end
end

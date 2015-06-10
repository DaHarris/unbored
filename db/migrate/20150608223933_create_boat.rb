class CreateBoat < ActiveRecord::Migration
  def change
    create_table :boats do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.string :icon, default: "Boat.png"
    end
  end
end

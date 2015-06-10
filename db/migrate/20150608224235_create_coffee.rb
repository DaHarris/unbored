class CreateCoffee < ActiveRecord::Migration
  def change
    create_table :coffees do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.string :icon, default: "Cafe.svg"
    end
  end
end

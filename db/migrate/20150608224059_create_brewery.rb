class CreateBrewery < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :open
      t.string :close
      t.string :phone
      t.string :address
      t.string :description
      t.string :icon, default: "brewery.png"
    end
  end
end

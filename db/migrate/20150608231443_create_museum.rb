class CreateMuseum < ActiveRecord::Migration
  def change
    create_table :museums do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.string :address
      t.integer :open
      t.integer :close
      t.integer :phone
      t.string :icon, default: "museum.png"
    end
  end
end

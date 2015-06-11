class CreateMuseum < ActiveRecord::Migration
  def change
    create_table :museums do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.string :address
      t.string :open
      t.string :close
      t.string :phone
      t.string :icon, default: "museum.png"
    end
  end
end

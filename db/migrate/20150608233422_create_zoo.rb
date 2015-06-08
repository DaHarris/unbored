class CreateZoo < ActiveRecord::Migration
  def change
    create_table :zoos do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.string :address
      t.integer :phone
      t.integer :open
      t.integer :close
      t.string :icon, default: "zoo.png"
    end
  end
end

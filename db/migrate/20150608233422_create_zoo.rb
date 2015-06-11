class CreateZoo < ActiveRecord::Migration
  def change
    create_table :zoos do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.string :address
      t.string :phone
      t.string :open
      t.string :close
      t.string :icon, default: "zoo.png"
    end
  end
end

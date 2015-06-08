class CreateGolf < ActiveRecord::Migration
  def change
    create_table :golves do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.integer :holes
      t.string :price
      t.integer :phone
      t.string :address
      t.integer :open
      t.integer :close
      t.string :icon, default: "golf.png"
    end
  end
end

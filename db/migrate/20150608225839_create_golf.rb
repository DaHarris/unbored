class CreateGolf < ActiveRecord::Migration
  def change
    create_table :golves do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.integer :holes
      t.string :price
      t.string :phone
      t.string :address
      t.string :open
      t.string :close
      t.string :icon, default: "golf.png"
    end
  end
end

class CreateBar < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.integer :open
      t.integer :close
      t.integer :phone
      t.string :address
      t.string :description
      t.string :icon, default: "beer.svg"
    end
  end
end

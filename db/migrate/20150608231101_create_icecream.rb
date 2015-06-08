class CreateIcecream < ActiveRecord::Migration
  def change
    create_table :icecreams do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.integer :open
      t.integer :close
      t.integer :phone
      t.string :address
      t.string :icon, default: "ice-cream.png"
    end
  end
end

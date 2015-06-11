class CreateIcecream < ActiveRecord::Migration
  def change
    create_table :icecreams do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.string :open
      t.string :close
      t.string :phone
      t.string :address
      t.string :icon, default: "icecream.png"
    end
  end
end

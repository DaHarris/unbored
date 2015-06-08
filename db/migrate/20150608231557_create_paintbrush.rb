class CreatePaintbrush < ActiveRecord::Migration
  def change
    create_table :paintbrushes do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.string :address
      t.integer :phone
      t.integer :open
      t.integer :close
      t.string :icon, default: "paintbrush.png"
    end
  end
end

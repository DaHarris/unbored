class CreatePaintbrush < ActiveRecord::Migration
  def change
    create_table :paintbrushes do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.string :address
      t.string :phone
      t.string :open
      t.string :close
      t.string :icon, default: "Paintbrush.png"
    end
  end
end

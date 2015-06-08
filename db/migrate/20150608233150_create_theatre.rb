class CreateTheatre < ActiveRecord::Migration
  def change
    create_table :theatres do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.string :address
      t.integer :phone
      t.string :icon, default: "theatre.png"
    end
  end
end

class CreateTheatre < ActiveRecord::Migration
  def change
    create_table :theatres do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.string :address
      t.string :phone
      t.string :icon, default: "Theatre.png"
    end
  end
end

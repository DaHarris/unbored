class CreateConcert < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.string :address
      t.integer :phone
      t.string :icon, default: "concert.png"
    end
  end
end

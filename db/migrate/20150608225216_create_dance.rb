class CreateDance < ActiveRecord::Migration
  def change
    create_table :dances do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.integer :open
      t.integer :close
      t.string :address
      t.integer :phone
      t.string :icon, default: "dance.png"
    end
  end
end

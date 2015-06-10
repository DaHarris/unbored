class CreateMovie < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.string :open
      t.string :close
      t.string :address
      t.string :phone
      t.string :icon, default: "Movie.png"
    end
  end
end

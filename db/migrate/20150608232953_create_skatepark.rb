class CreateSkatepark < ActiveRecord::Migration
  def change
    create_table :skateparks do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.string :icon, default: "Skatepark.png"
    end
  end
end

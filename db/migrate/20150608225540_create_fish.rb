class CreateFish < ActiveRecord::Migration
  def change
    create_table :fish do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.string :icon, default: "Fish.png"
    end
  end
end

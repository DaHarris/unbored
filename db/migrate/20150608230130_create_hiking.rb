class CreateHiking < ActiveRecord::Migration
  def change
    create_table :hikings do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.string :icon, default: "Hiking.png"
    end
  end
end

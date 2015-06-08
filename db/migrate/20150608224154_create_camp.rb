class CreateCamp < ActiveRecord::Migration
  def change
    create_table :camps do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.string :icon, default: "camp.jpg"
    end
  end
end

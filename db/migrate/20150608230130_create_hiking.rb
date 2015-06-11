class CreateHiking < ActiveRecord::Migration
  def change
    create_table :hikings do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.string :icon, default: "hiking.png"
    end
  end
end

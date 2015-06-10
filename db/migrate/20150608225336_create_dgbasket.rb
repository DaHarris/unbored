class CreateDgbasket < ActiveRecord::Migration
  def change
    create_table :dgbaskets do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.integer :holes
      t.string :icon, default: "Dgbasket.png"
    end
  end
end

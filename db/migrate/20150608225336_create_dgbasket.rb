class CreateDgbasket < ActiveRecord::Migration
  def change
    create_table :dgbaskets do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.integer :holes
      t.string :icon, default: "dgbasket.png"
    end
  end
end

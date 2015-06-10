class CreateTourist < ActiveRecord::Migration
  def change
    create_table :tourists do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :description
      t.string :address
      t.string :phone
      t.string :open
      t.string :close
      t.float :price
      t.string :icon, default: "Tourist.png"
    end
  end
end

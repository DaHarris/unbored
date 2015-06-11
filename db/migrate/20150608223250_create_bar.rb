class CreateBar < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :name
      t.float :lat
      t.float :long
      t.string :open
      t.string :close
      t.string :phone
      t.string :address
      t.string :description
      t.string :icon, default: "bar.svg"
    end
  end
end

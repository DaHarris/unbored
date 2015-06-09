class ChangeCoffeeColumnName < ActiveRecord::Migration
  def change
    rename_table :coffees, :cafes
  end
end

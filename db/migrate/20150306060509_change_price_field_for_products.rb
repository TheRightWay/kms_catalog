class ChangePriceFieldForProducts < ActiveRecord::Migration
  def change
    change_column :products, :price, :decimal, precision: 12, scale: 2
    change_column :variants, :price, :decimal, precision: 12, scale: 2
  end
end

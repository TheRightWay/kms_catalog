class ChangePriceFieldForProducts < ActiveRecord::Migration[4.2]
  def change
    change_column :kms_products, :price, :decimal, precision: 12, scale: 2
    change_column :kms_variants, :price, :decimal, precision: 12, scale: 2
  end
end

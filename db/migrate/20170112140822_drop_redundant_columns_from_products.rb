class DropRedundantColumnsFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :kms_products, :price, :decimal, precision: 12, scale: 2
    remove_column :kms_products, :image, :string
    remove_column :kms_products, :preview_image, :string
  end
end

class AddSlugToProducts < ActiveRecord::Migration[4.2]
  def change
    add_column :kms_products, :slug, :string
    add_index :kms_products, :slug, :unique => true
  end
end

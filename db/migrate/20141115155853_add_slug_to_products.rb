class AddSlugToProducts < ActiveRecord::Migration
  def change
    add_column :kms_products, :slug, :string
    add_index :kms_products, :slug, :unique => true
  end
end

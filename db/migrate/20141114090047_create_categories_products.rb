class CreateCategoriesProducts < ActiveRecord::Migration[4.2]
  def change
    create_table :kms_categories_products, id: false do |t|
      t.integer :category_id
      t.integer :product_id
    end

    add_index :kms_categories_products, :category_id
    add_index :kms_categories_products, :product_id
  end
end

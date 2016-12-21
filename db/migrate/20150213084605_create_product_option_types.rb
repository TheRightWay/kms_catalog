class CreateProductOptionTypes < ActiveRecord::Migration
  def change
    create_table :product_option_types do |t|
      t.references :product, index: true
      t.references :option_type, index: true

      t.timestamps null: false
    end
    add_foreign_key :product_option_types, :products if respond_to?(:add_foreign_key)
    add_foreign_key :product_option_types, :option_types if respond_to?(:add_foreign_key)
  end
end

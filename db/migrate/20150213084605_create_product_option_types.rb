class CreateProductOptionTypes < ActiveRecord::Migration[4.2]
  def change
    create_table :kms_product_option_types do |t|
      t.references :product, index: true
      t.references :option_type, index: true

      t.timestamps null: false
    end
    add_foreign_key :kms_product_option_types, :products if respond_to?(:add_foreign_key)
    add_foreign_key :kms_product_option_types, :option_types if respond_to?(:add_foreign_key)
  end
end

class CreateVariants < ActiveRecord::Migration[4.2]
  def change
    create_table :kms_variants do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2
      t.references :product, index: true

      t.timestamps null: false
    end
    add_foreign_key :kms_variants, :kms_products if respond_to?(:add_foreign_key)
  end
end

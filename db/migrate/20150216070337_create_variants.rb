class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2
      t.references :product, index: true

      t.timestamps null: false
    end
    add_foreign_key :variants, :products if respond_to?(:add_foreign_key)
  end
end

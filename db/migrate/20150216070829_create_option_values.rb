class CreateOptionValues < ActiveRecord::Migration[4.2]
  def change
    create_table :kms_option_values do |t|
      t.references :option_type, index: true
      t.references :variant, index: true
      t.string :value

      t.timestamps null: false
    end
    add_foreign_key :kms_option_values, :kms_option_types if respond_to?(:add_foreign_key)
    add_foreign_key :kms_option_values, :kms_variants if respond_to?(:add_foreign_key)
  end
end

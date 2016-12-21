class CreateOptionValues < ActiveRecord::Migration
  def change
    create_table :option_values do |t|
      t.references :option_type, index: true
      t.references :variant, index: true
      t.string :value

      t.timestamps null: false
    end
    add_foreign_key :option_values, :option_types if respond_to?(:add_foreign_key)
    add_foreign_key :option_values, :variants if respond_to?(:add_foreign_key)
  end
end

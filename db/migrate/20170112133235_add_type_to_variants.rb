class AddTypeToVariants < ActiveRecord::Migration[5.0]
  def change
    add_column :kms_variants, :type, :string, default: Kms::Variant.name
  end
end

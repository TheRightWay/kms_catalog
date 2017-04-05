class AddImageToVariants < ActiveRecord::Migration[4.2]
  def change
    add_column :kms_variants, :image, :string
  end
end

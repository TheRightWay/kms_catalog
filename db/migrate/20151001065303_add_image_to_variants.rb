class AddImageToVariants < ActiveRecord::Migration
  def change
    add_column :kms_variants, :image, :string
  end
end

class AddPreviewImageAndImageToProduct < ActiveRecord::Migration[4.2]
  def change
    add_column :kms_products, :image, :string
    add_column :kms_products, :preview_image, :string
  end
end

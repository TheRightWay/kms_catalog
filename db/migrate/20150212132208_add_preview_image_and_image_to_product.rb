class AddPreviewImageAndImageToProduct < ActiveRecord::Migration
  def change
    add_column :kms_products, :image, :string
    add_column :kms_products, :preview_image, :string
  end
end

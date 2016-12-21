class AddPreviewImageAndImageToProduct < ActiveRecord::Migration
  def change
    add_column :products, :image, :string
    add_column :products, :preview_image, :string
  end
end

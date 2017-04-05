class AddPositionToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :kms_products, :position, :integer, default: 0, null: false
  end
end

class CreateProperties < ActiveRecord::Migration[4.2]
  def change
    create_table :kms_properties do |t|
      t.string :name
      t.string :value
      t.string :tag
      t.references :product
      t.timestamps null: false
    end
  end
end

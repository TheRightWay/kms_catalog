class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.string :value
      t.string :tag
      t.references :product
      t.timestamps null: false
    end
  end
end

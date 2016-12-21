class CreateCategories < ActiveRecord::Migration
  def change
    create_table :kms_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

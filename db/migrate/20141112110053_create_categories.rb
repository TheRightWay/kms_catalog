class CreateCategories < ActiveRecord::Migration[4.2]
  def change
    create_table :kms_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

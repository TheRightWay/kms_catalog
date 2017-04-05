class AddSlugToCategories < ActiveRecord::Migration[4.2]
  def change
    add_column :kms_categories, :slug, :string
    add_index :kms_categories, :slug, :unique => true
  end
end

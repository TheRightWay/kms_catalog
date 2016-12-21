class AddSlugToCategories < ActiveRecord::Migration
  def change
    add_column :kms_categories, :slug, :string
    add_index :kms_categories, :slug, :unique => true
  end
end

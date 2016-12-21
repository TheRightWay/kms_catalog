class AddAncestryToCategories < ActiveRecord::Migration
  def change
    add_column :kms_categories, :ancestry, :string
    add_index :kms_categories, :ancestry
  end
end

class AddAncestryToCategories < ActiveRecord::Migration[4.2]
  def change
    add_column :kms_categories, :ancestry, :string
    add_index :kms_categories, :ancestry
  end
end

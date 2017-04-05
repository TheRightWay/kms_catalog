class AddDescriptionAndLogoToCategories < ActiveRecord::Migration[4.2]
  def change
    add_column :kms_categories, :description, :text
    add_column :kms_categories, :logo, :string
  end
end

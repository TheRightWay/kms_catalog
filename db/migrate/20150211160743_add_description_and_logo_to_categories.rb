class AddDescriptionAndLogoToCategories < ActiveRecord::Migration
  def change
    add_column :kms_categories, :description, :text
    add_column :kms_categories, :logo, :string
  end
end

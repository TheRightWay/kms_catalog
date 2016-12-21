class AddDescriptionAndLogoToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :description, :text
    add_column :categories, :logo, :string
  end
end

class AddSeoFieldsToCategories < ActiveRecord::Migration[4.2]
  def change
    add_column :kms_categories, :seo_title, :string
    add_column :kms_categories, :seo_keywords, :string
    add_column :kms_categories, :seo_description, :string
  end
end

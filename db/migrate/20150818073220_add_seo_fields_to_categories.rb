class AddSeoFieldsToCategories < ActiveRecord::Migration
  def change
    add_column :kms_categories, :seo_title, :string
    add_column :kms_categories, :seo_keywords, :string
    add_column :kms_categories, :seo_description, :string
  end
end

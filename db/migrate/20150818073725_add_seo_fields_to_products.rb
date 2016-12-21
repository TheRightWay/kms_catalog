class AddSeoFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :kms_products, :seo_title, :string
    add_column :kms_products, :seo_keywords, :string
    add_column :kms_products, :seo_description, :string
  end
end

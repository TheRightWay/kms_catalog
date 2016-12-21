class AddSeoFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :seo_title, :string
    add_column :products, :seo_keywords, :string
    add_column :products, :seo_description, :string
  end
end

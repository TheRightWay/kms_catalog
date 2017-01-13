module Kms
  class ProductSerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :category_ids, :seo_title, :seo_keywords, :seo_description
    has_one :master
    has_many :variants

    def category_ids
      object.category_ids
    end

  end
end

module Kms
  class ProductDrop < Liquor::Drop
    include Kms::Catalog::Engine.routes.url_helpers
    attributes :name, :description, :price, :permalink
    has_many :children
    has_many :categories
    has_many :variants
    # has_many :properties

    export :image_url
    export :preview_image_url
    export :properties
    scopes :order

    def image_url
      source.image.url
    end

    def preview_image_url
      source.preview_image.url
    end

    def price
      source.price.to_s
    end

    def properties
      props = []
      source.properties.group_by(&:tag).each do |key, value|
        props << [key, value.map { |val| [val.name, val.value] }]
      end
      props
    end
  end
end

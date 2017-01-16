module Kms
  class ProductDrop < Liquor::Drop
    include Kms::Catalog::Engine.routes.url_helpers
    attributes :name, :description, :price, :permalink
    has_many :children
    has_many :categories
    has_one :master
    has_many :variants
    # has_many :properties

    export :image_url
    export :properties
    scopes :order

    def image_url
      source.master.image.url
    end

    def price
      source.master.price.to_s
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

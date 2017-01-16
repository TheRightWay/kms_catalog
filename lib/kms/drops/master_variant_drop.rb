module Kms
  class MasterVariantDrop < VariantDrop
    attributes :id, :name, :price
    export :image_url

    def image_url
      source.image.url
    end

    def price
      source.price.to_s
    end
  end
end

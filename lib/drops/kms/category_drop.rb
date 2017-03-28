module Kms
  class CategoryDrop < Liquor::Drop
    include Kms::Catalog::Engine.routes.url_helpers
    attributes :name, :permalink, :description
    has_many :children
    has_many :products, include: :master
    belongs_to :parent

    export :logo_url
    scopes :order

    def logo_url
      source.logo.url
    end
  end
end

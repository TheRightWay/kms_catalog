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

    class Scope

      def order(*args)
        args = Liquor::Drop.unwrap_scope_arguments(args)
        parsed_args = args.map do |arg|
          order_clause = arg.split(' ')
          if order_clause[0].in? Kms::Product.column_names
            arg
          else
            [ Kms::Variant.table_name, arg ].join('.') # kms_variants.price
          end
        end
        Liquor::DropDelegation.wrap_scope source.order(*parsed_args)
      end
    end
  end
end

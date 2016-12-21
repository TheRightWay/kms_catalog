module Kms
  class PropertyDrop < Liquor::Drop
    attributes :name, :value, :tag
    belongs_to :product
  end
end

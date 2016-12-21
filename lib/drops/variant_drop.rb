class VariantDrop < Liquor::Drop
  attributes :name, :price
  has_many :option_values
  export :image_url

  def image_url
    source.image.url
  end

  def price
    source.price.to_s
  end
end

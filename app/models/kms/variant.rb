module Kms
  class Variant < ActiveRecord::Base
    include Liquor::Dropable
    belongs_to :product, optional: true
    has_many :option_values, dependent: :destroy
    has_many :option_types, through: :option_values

    mount_uploader :image, ProductImageUploader
  end
end

module Kms
  class Product < ActiveRecord::Base
    include Liquor::Dropable
    extend FriendlyId
    include Kms::Permalinkable
    include Kms::CompileTemplates
    has_and_belongs_to_many :categories
    has_many :properties, dependent: :destroy

    has_many :product_option_types, dependent: :destroy
    has_many :option_types, through: :product_option_types

    has_many :variants, dependent: :destroy

    friendly_id :name, use: :slugged

    mount_uploader :image, ProductImageUploader
    mount_uploader :preview_image, ProductImageUploader
  end
end
